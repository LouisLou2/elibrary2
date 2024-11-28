 import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:elibapp/features/chart/const/chart_type.dart';
import 'package:elibapp/features/chart/repo/chart_repo.dart';
import 'package:elibapp/features/chart/widget/artwork_title.dart';
import 'package:elibapp/features/global_aggreement/const/const_shared_widget.dart';
import 'package:elibapp/shared/widget/image_tile.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../entity/book/book_brief_abs.dart';
import '../bloc/chart_bloc.dart';
import '../bloc/chart_event.dart';
import '../bloc/chart_state.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  final ChartRepo _chartRepo = GetIt.I<ChartRepo>();
  bool _gotChartTypeFromNav= false;
  late ValueNotifier<ChartType> _chartTypeNotifier;
  final RefreshController _refreshController = RefreshController();

  void _onRefresh(BuildContext widgetContext, ChartType type) {
    print('@@@@@@@@@@@@@@add ReqRefreshNet: $type');
    // 即请求通过网络来刷新数据
    widgetContext.read<ChartBloc>().add(ReqRefreshNet(type));
  }

  void _onLoadMore(BuildContext widgetContext, ChartType type) {
    print('@@@@@@@@@@@@@@add ReqLoadMoreNet: $type');
    // 即请求通过网络来加载更多数据
    widgetContext.read<ChartBloc>().add(ReqLoadMoreNet(type));
  }

  void _listenState(BuildContext widgetContext,ChartPageState state) {
    print('@@@@@@@@@@@@@@@listen state $state');
    if (state is ChartPageRefreshLocal) {
      print('@@@@@@@@@@@@@@@refresh local');
      // 需要加一个事件，本地刷新之后，再去刷新网络数据
      WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          widgetContext.read<ChartBloc>().add(ReqRefreshNet(state.type));
        });
      });
      return;
    }
    if (state is ChartPageRefreshError) {
      _refreshController.refreshFailed();
      return;
    }
    if (state is ChartPageRefreshLoading) {
      print('@@@@@@@@@@@@@@@refresh loading');
      _refreshController.requestRefresh(needMove: true, needCallback: false);
      return;
    }
    if (state is ChartPageRefresh) {
      print('@@@@@@@@@@@@@@@refresh complete');
      _refreshController.refreshCompleted();
      return;
    }

    if (state is ChartPageLoadMoreError) {
      _refreshController.loadFailed();
      return;
    }
    if (state is ChartPageLoadingMore) {
      _refreshController.requestLoading(needMove: true, needCallback: false);
      return;
    }
    if (state is ChartPageLoadMoreOver) {
      if (!state.hasMoreData) {
        _refreshController.loadNoData();
      } else {
        _refreshController.loadComplete();
      }
      return;
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print('@@@@@@@@@@@@@@@@@build');
    if (!_gotChartTypeFromNav){
      print('@@@@@@@@@@@@@@@@@get chart type from nav');
      // ChartType chartType = ModalRoute.of(context)!.settings.arguments as ChartType; // 从路由参数中获取chart type
      ChartType chartType = ChartType.Trending;
      _chartTypeNotifier = ValueNotifier<ChartType>(chartType);
      _gotChartTypeFromNav = true;
    }

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 70,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
              ),
            ),
            ValueListenableBuilder<ChartType>(
              valueListenable: _chartTypeNotifier,
              builder: (context, value, child) {
                return ArtworkTitle(title: '图书${value.name}', size: 20);
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              width: 80,
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: <Widget>[
                  getChartSideItem(ChartType.Trending.typeName, _chartTypeNotifier.value == ChartType.Trending, () {}),
                  getChartSideItem(ChartType.HighlyRated.typeName, _chartTypeNotifier.value == ChartType.HighlyRated, () {}),
                ],
              ),
            ),
          ),
          Expanded(
            child: RepositoryProvider.value(
              value: GetIt.I<ChartRepo>(),
              child: BlocProvider(
                create: (context) {
                  print('@@@@@@@@@@@@@@@@@create ChartBloc');
                  return ChartBloc(ChartPageRefreshLocal(_chartTypeNotifier.value));
                },
                lazy: false,
                child: BlocListener<ChartBloc, ChartPageState>(
                  listener: (context, state) {
                    _listenState(context, state);
                  },
                  child: Builder(
                    builder: (context) {
                      print('@@@@@@@@@@@@@@@@@builder widget');
                      return BlocBuilder<ChartBloc, ChartPageState>(
                        buildWhen: (previous, current) {
                          print('@@@@@@@@@@@@@@@buildWhen previous: $previous, current: $current');
                          return current is ChartPageRefreshLocal || current is ChartPageRefresh ||( current is ChartPageLoadMoreOver && current.hasMoreData);
                        },
                        builder: (context, state) {
                          print('@@@@@@@@@@@@@@@@builder state: $state');
                          if (state is ChartPageRefreshLocal) {
                            // 需要加一个事件，本地刷新之后，再去刷新网络数据
                            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
                              Future.delayed(const Duration(milliseconds: 10000), () {
                                context.read<ChartBloc>().add(ReqRefreshNet(state.type));
                              });
                            });
                          }
                          return SmartRefresher(
                            physics: const BouncingScrollPhysics(),
                            enablePullDown: true,
                            enablePullUp: true,
                            header: ConstSharedWidget.classicRefreshHeader,
                            footer: ConstSharedWidget.classicRefreshFooter,
                            controller: _refreshController,
                            onRefresh: () => _onRefresh(context, _chartTypeNotifier.value),
                            onLoading: () => _onLoadMore(context, _chartTypeNotifier.value),
                            child: ListView.builder(
                              itemExtent: 110,
                              itemBuilder: (c, i){
                                BookBriefAbs book = _chartRepo.getBookByIndexMem(_chartTypeNotifier.value, i)!;
                                return getElementTile(_chartTypeNotifier.value, book, i);
                              },
                              itemCount: _chartRepo.lengthInMemCount(_chartTypeNotifier.value),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget getChartSideItem(String name, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: ColoredBox(
        color: selected ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).bottomSheetTheme.backgroundColor!,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            child: ArtworkTitle(title: name, size: 14, color: selected ? Theme.of(context).primaryColor : null),
          ),
        ),
      ),
    );
  }

  Widget getElementTile(ChartType type,BookBriefAbs book, int index) {
    if (type == ChartType.Trending) {
      var tbBook = book as BookBriefTB;
      return ImageTile(
        title: tbBook.title,
        image: getCustomCachedImage(
          url: tbBook.coverMUrl,
          height: 100,
          width: 68,
        ),
        subTitle: tbBook.authorNamesStr,
        thirdTitle: '评分 ${tbBook.rating}',
      );
    }
    if (type == ChartType.HighlyRated) {
      var tbBook = book as BookBriefTB;
      return ImageTile(
        title: tbBook.title,
        image: getCustomCachedImage(
          url: tbBook.coverMUrl,
          height: 100,
          width: 100,
        ),
        subTitle: tbBook.authorNamesStr,
        thirdTitle: '评分 ${tbBook.rating}',
      );
    }
    throw Exception('未知的chart type');
  }
}