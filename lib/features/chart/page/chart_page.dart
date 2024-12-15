import 'package:elibapp/features/chart/const/chart_type.dart';
import 'package:elibapp/features/chart/repo/chart_repo.dart';
import 'package:elibapp/features/chart/widget/artwork_title.dart';
import 'package:elibapp/features/global_aggreement/const/const_shared_widget.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/book_brief_tile.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../entity/book/book_brief_abs.dart';
import '../bloc/chart_bloc.dart';
import '../bloc/chart_event.dart';
import '../bloc/chart_state.dart';
import '../widget/chart_side_item.dart';

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


  void _changeType(BuildContext widgetContext,ChartType type) {
    widgetContext.read<ChartBloc>().add(ReqRefreshLocal(type));
    _chartTypeNotifier.value = type;
  }

  void _onRefresh(BuildContext widgetContext, ChartType type) {
    // 即请求通过网络来刷新数据
    widgetContext.read<ChartBloc>().add(ReqRefreshNet(type));
  }

  void _onLoadMore(BuildContext widgetContext, ChartType type) {
    // 即请求通过网络来加载更多数据
    widgetContext.read<ChartBloc>().add(ReqLoadMoreNet(type));
  }

  void _listenState(BuildContext widgetContext,ChartPageState state) {
    // if (state is ChartPageRefreshLocal) {
    //   // 需要加一个事件，本地刷新之后，再去刷新网络数据
    //   WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    //     Future.delayed(const Duration(milliseconds: 1000), () {
    //       widgetContext.read<ChartBloc>().add(ReqRefreshNet(state.type));
    //     });
    //   });
    //   return;
    // }
    if (state is ChartPageRefreshError) {
      _refreshController.refreshFailed();
      return;
    }
    if (state is ChartPageRefreshLoading) {
      _refreshController.requestRefresh(needMove: true, needCallback: false);
      return;
    }
    if (state is ChartPageRefresh) {
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

  void _trySafeRefresh(BuildContext aContext, ChartType type) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        aContext.read<ChartBloc>().add(ReqRefreshNet(type));
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (!_gotChartTypeFromNav){
      print('@@@@@@@@@@@@@@@@@get chart type from nav');
      ChartType chartType = ModalRoute.of(context)!.settings.arguments as ChartType; // 从路由参数中获取chart type
      // ChartType chartType = ChartType.Trending;
      _chartTypeNotifier = ValueNotifier<ChartType>(chartType);
      _gotChartTypeFromNav = true;
    }

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 70,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => NavigationHelper.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24,
              ),
            ),
            ValueListenableBuilder<ChartType>(
              valueListenable: _chartTypeNotifier,
              builder: (context, value, child) {
                return ArtworkTitle(title: '图书${value.typeName}', size: 20);
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) {
          return ChartBloc(ChartPageRefreshLocal(_chartTypeNotifier.value));
        },
        lazy: false,
        child: Row(
          children: <Widget>[
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                width: 80,
                color: Theme.of(context).bottomSheetTheme.backgroundColor,
                height: MediaQuery.sizeOf(context).height,
                child: ValueListenableBuilder<ChartType>(
                  valueListenable: _chartTypeNotifier,
                  builder: (context, value, child) {
                    return Column(
                      children: <Widget>[
                        ChartSideItem(name: ChartType.Trending.typeName, selected: _chartTypeNotifier.value == ChartType.Trending, onTap: () =>  _changeType(context, ChartType.Trending)),
                        ChartSideItem(name: ChartType.HighlyRated.typeName, selected: _chartTypeNotifier.value == ChartType.HighlyRated, onTap: () =>  _changeType(context, ChartType.HighlyRated)),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: RepositoryProvider.value(
                value: GetIt.I<ChartRepo>(),
                child: BlocListener<ChartBloc, ChartPageState>(
                  listener: (context, state) {
                    _listenState(context, state);
                  },
                  child: Builder(
                    builder: (context) {
                      return BlocConsumer<ChartBloc, ChartPageState>(
                        listenWhen: (previous, current) => current is ChartPageRefreshLocal,
                        listener: (BuildContext context, ChartPageState state) {},
                        buildWhen: (previous, current) => current is ChartPageRefreshLocal || current is ChartPageRefresh ||( current is ChartPageLoadMoreOver && current.hasMoreData),
                        builder: (context, state) {

                          if (state is ChartPageRefreshLocal) {
                            _trySafeRefresh(context, state.type);
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
                                return BookBriefTile(
                                  title: book.title,
                                  titleSize: 16,
                                  image: getCustomCachedImage(url: book.coverSUrl, width: 70, height: 100),
                                  authors: book.authorNames,
                                  onTap: () => NavigationHelper.toBookView(isbn: book.isbn, coverUrl: book.coverMUrl),
                                );
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
          ],
        ),
      )
    );
  }
}