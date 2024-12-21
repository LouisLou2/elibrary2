import 'package:elibapp/entity/book/book_brief_sub_cate.dart';
import 'package:elibapp/features/sub_cate_book/bloc/sub_cate_book_load_bloc.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/spec/image_widget.dart';

class SubCateBookListPage extends StatefulWidget{
  final int cateId;
  const SubCateBookListPage(this.cateId, {super.key});
  @override
  State<SubCateBookListPage> createState()=>_CategoryBookState();
}

class _CategoryBookState extends State<SubCateBookListPage>{
  late final RefreshController _refreshControllers;

  @override
  void initState(){
    _refreshControllers = RefreshController();
    super.initState();
  }

  @override
  void dispose(){
    _refreshControllers.dispose();
    super.dispose();
  }

  void _handleListenEvent(SubCateBookLoadState state) {
    switch (state) {
      case SubCateBookLoadState.refreshingNet:
        // _refreshControllers.requestRefresh(needMove: true, needCallback: false);
        break;
      case SubCateBookLoadState.loadingMore:
      // _refreshControllers[value].requestLoading(needMove: true, needCallback: false);
        break;
      case SubCateBookLoadState.refreshedNet:
        _refreshControllers.refreshCompleted();
        break;
      case SubCateBookLoadState.loadedMore:
        _refreshControllers.loadComplete();
        break;
      case SubCateBookLoadState.refreshNetFailed:
        _refreshControllers.refreshFailed();
        break;
      case SubCateBookLoadState.loadMoreFailed:
        _refreshControllers.loadFailed();
        break;
      default:
        throw Exception('Unknown state: $state');
    }
  }

  @override
  Widget build(BuildContext context){

    print('@@@@@@@@@@@@@@@[build]SubCateBookListPage: ${widget.cateId}');

    return BlocProvider(
      key: ValueKey(widget.cateId),
      create: (context) => SubCateBookLoadBloc(widget.cateId,),
      lazy: false,
      child: BlocConsumer<SubCateBookLoadBloc, SubCateBookLoadState>(
        key: ValueKey(widget.cateId),
        listenWhen: (previous, current){
          return current == SubCateBookLoadState.refreshingNet ||
              current == SubCateBookLoadState.refreshedNet ||
              current == SubCateBookLoadState.refreshNetFailed ||
              current == SubCateBookLoadState.loadingMore ||
              current == SubCateBookLoadState.loadedMore ||
              current == SubCateBookLoadState.loadMoreFailed;
        },
        buildWhen: (previous, current){
          return current == SubCateBookLoadState.loadingNowNoData ||
              current == SubCateBookLoadState.retry ||
              current == SubCateBookLoadState.refreshedLocal ||
              current == SubCateBookLoadState.refreshedNet ||
              current == SubCateBookLoadState.loadedMore;
        },
        listener: (context, state) => _handleListenEvent(state),
        builder: (context, state) {
          switch (state) {
            case SubCateBookLoadState.loadingNowNoData:
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case SubCateBookLoadState.retry:
              return Expanded(
                child: Center(
                  child: ReloadWidget(
                    tile: AppStrs.youOffline,
                    subtitle: AppStrs.tryReconnect,
                    onReload: () => context.read<SubCateBookLoadBloc?>()?.add(SubCateBookLoadEvent.reqLoadNowNoData),
                  ),
                ),
              );
            case SubCateBookLoadState.refreshedLocal:
            case SubCateBookLoadState.refreshedNet:
            case SubCateBookLoadState.loadedMore:
              List<BookBriefSC> books = context.read<SubCateBookLoadBloc>().bookBriefs;
              return Expanded(
                  child: SmartRefresher(
                    physics: const BouncingScrollPhysics(),
                    controller: _refreshControllers,
                    onRefresh: () => context.read<SubCateBookLoadBloc?>()?.add(SubCateBookLoadEvent.reqRefresh),
                    onLoading: (){
                      context.read<SubCateBookLoadBloc?>()?.add(SubCateBookLoadEvent.reqLoadMore);
                    },
                    enablePullDown: true,
                    enablePullUp: context.read<SubCateBookLoadBloc>().hasRefreshedNet,
                    header: const ClassicHeader(),
                    footer: const ClassicFooter(),
                    child: books.isEmpty ?
                    const Center(child: Text('没有书籍')) :
                    ListView.builder(
                      itemCount: books.length,
                      itemExtent: 130,
                      itemBuilder: (context, index) => ImageTile(
                        key: ValueKey(books[index].isbn),
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        title: books[index].title,
                        subTitle: books[index].authorNamesStr,
                        thirdTitle: books[index].publisherName,
                        image: getCustomCachedImage(
                          url: books[index].coverMUrl,
                          width: 80,
                          height: 112,
                        ),
                        titleWeight: FontWeight.w500,
                        subtitleColor: Theme.of(context).colorScheme.primary,
                        onTap: () => NavigationHelper.toBookView(isbn: books[index].isbn, coverUrl: books[index].coverMUrl),
                        fontSize: 18,
                        fontSize3: 13,
                      ),
                    ),
                  )
              );
            default:
              throw Exception('Unknown state: $state');
          }
        },
      ),
    );
  }
}