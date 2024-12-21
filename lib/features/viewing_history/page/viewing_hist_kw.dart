import 'package:elibapp/util/format_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../entity/book/book_viewing_history.dart';
import '../../../helper/nav/navigation_helper.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../bloc/list/vb_bloc.dart';

class ViewingHistKw extends StatefulWidget {
  final String kw;
  const ViewingHistKw(this.kw, {super.key});

  @override
  State<StatefulWidget> createState() => _ViewingHistKwState();
}

class _ViewingHistKwState extends State<ViewingHistKw> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VbBloc.byKeyword(widget.kw),
      child: BlocConsumer<VbBloc, VbState>(
        listenWhen: (previous, current){
          return current == VbState.loadingMore
              || current == VbState.loadedMore
              || current == VbState.loadingMoreError
              || current == VbState.loadNoMore;
        },
        buildWhen: (previous, current){
          return current == VbState.loading
              || current == VbState.retry
              || current == VbState.loaded
              || current == VbState.loadedMore
              || current == VbState.loadNoMore;
        },
        listener: (context, state) {
          switch (state) {
            case VbState.loadingMore:
              _refreshController.requestLoading(needMove: true, needCallback: false);
              break;
            case VbState.loadedMore:
              _refreshController.loadComplete();
              break;
            case VbState.loadingMoreError:
              _refreshController.loadFailed();
              break;
            case VbState.loadNoMore:
              _refreshController.loadNoData();
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          switch (state) {
            case VbState.loading:
              return const Center(child: CircularProgressIndicator());
            case VbState.retry:
              return Center(
                child: ReloadWidget(
                  tile: AppStrs.youOffline,
                  subtitle: AppStrs.tryReconnect,
                  onReload: () => context.read<VbBloc?>()?.add(VbEvent.reqReloadNowNoData),
                ),
              );
            case VbState.loaded:
            case VbState.loadedMore:
            case VbState.loadNoMore:
              List<BookViewingHistory> vbHistList = context.read<VbBloc?>()?.vbHistList ?? [];
              return SmartRefresher(
                controller: _refreshController,
                header: const ClassicHeader(),
                footer: const ClassicFooter(),
                enablePullDown: false,
                enablePullUp: state == VbState.loadNoMore ? false : true,
                onLoading: () => context.read<VbBloc?>()?.add(VbEvent.reqLoadMore),
                child: vbHistList.isEmpty ? const Center(child: Text('No data'))
                : ListView.builder(
                  itemCount: vbHistList.length,
                  itemExtent: 120,
                  itemBuilder: (context, i) {
                    BookViewingHistory vbHist = vbHistList[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ImageTile(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        padding: const EdgeInsets.all(12),
                        borderR: 10,
                        image: getCustomCachedImage(
                          url: vbHist.coverMUrl,
                          width: 60,
                          height: 84,
                        ),
                        title: vbHist.title,
                        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                        titleWeight: FontWeight.w500,
                        subTitle: '作者 | ${vbHist.authorNamesStr}',
                        thirdTitle: '${FormatTool.ymdhmsStr(vbHist.viewingTime)} 浏览',
                        fontSize3: Theme.of(context).textTheme.bodySmall?.fontSize,
                        onTap: () => NavigationHelper.toBookView(isbn: vbHist.isbn, coverUrl: vbHist.coverMUrl),
                        actionWidget: Icon(
                          CupertinoIcons.forward,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    );
                  },
                ),
              );
            default:
              return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}