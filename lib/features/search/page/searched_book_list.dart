import 'package:elibapp/common/search_type.dart';
import 'package:elibapp/entity/search/searched_book.dart';
import 'package:elibapp/features/search/bloc/search/search_event.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../bloc/search/search_bloc.dart';
import '../bloc/search/search_state.dart';
import '../bloc/search_control/search_control_bloc.dart';
import '../bloc/search_control/search_control_state.dart';

class SearchedBookListPage extends StatefulWidget {
  final String keyword;
  final bool forceSearch;
  const SearchedBookListPage({super.key, required this.keyword, required this.forceSearch});
  @override
  State<SearchedBookListPage> createState() => _SearchedBookListPageState();
}

class _SearchedBookListPageState extends State<SearchedBookListPage> with AutomaticKeepAliveClientMixin{

  final RefreshController _refreshController = RefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => SearchBloc(SearchInType.books,widget.keyword),
      child: BlocListener<SearchControlBloc, SearchControlState>(
        listenWhen: (previous, current){
          return current is InputChanged;
        },
        listener: (context, state) {
          if (state is InputChanged) {
            context.read<SearchBloc>().add(
                ReqSearchAgain(state.keyword)
            );
          }
        },
        child: BlocConsumer<SearchBloc, SearchState>(
          listenWhen: (previous, current){
            return current == SearchState.loadingMore
                || current == SearchState.loadMoreError
                || current == SearchState.loadedMore;
          },
          buildWhen: (previous, current){
            return current == SearchState.loadingRes
                || current == SearchState.retry
                || current == SearchState.loadedRes
                || current == SearchState.loadedMore;
          },
          listener: (context, state) {
            switch (state){
              case SearchState.loadMoreError:
                _refreshController.loadFailed();
                break;
              case SearchState.loadedMore:
                _refreshController.loadComplete();
                break;
              case SearchState.loadingMore:
                _refreshController.requestLoading(needMove: true,needCallback: false);
                break;
              default:
                throw Exception('Unknown state: $state');
            }
          },
          builder: (context, state) {
            switch (state){
              case SearchState.loadingRes:
                // 这里是初始加载的状态
                String word = context.read<SearchControlBloc>().keyword;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (widget.forceSearch) {
                    context.read<SearchBloc?>()?.add(ReqSearchAgain(word, withNewWord: true));
                  }
                });
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case SearchState.retry:
                return ReloadWidget(
                  tile: AppStrs.youOffline,
                  subtitle: AppStrs.tryReconnect,
                  onReload: (){
                    context.read<SearchBloc?>()?.add(const ReqSearchAgain('', withNewWord: false));
                  },
                );
              case SearchState.loadedRes:
              case SearchState.loadedMore:
                List<SearchedBook> books = context.read<SearchBloc>().results as List<SearchedBook>;
                return SmartRefresher(
                  physics: const BouncingScrollPhysics(),
                  controller: _refreshController,
                  onLoading: ()=>context.read<SearchBloc?>()?.add(SearchEvent.loadMore),
                  enablePullDown: false,
                  enablePullUp: true,
                  header: const ClassicHeader(),
                  footer: const ClassicFooter(),
                  child: books.isEmpty ?
                  const Center(child: Text('没有记录')) :
                  ListView.builder(
                    itemCount: books.length,
                    itemExtent: 100,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: ImageTile(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          image: getCustomCachedImage(
                            url: books[i].coverSUrl,
                            width: 60,
                            height: 84,
                          ),
                          title: books[i].title,
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                          titleWeight: FontWeight.w500,
                          subTitle: '作者 | ${books[i].authorNamesStr}',
                          thirdTitle: '评分 | ${books[i].rating}',
                          fontSize3: Theme.of(context).textTheme.bodySmall?.fontSize,
                          onTap: () => NavigationHelper.toBookView(isbn: books[i].isbn, coverUrl: books[i].coverSUrl),
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
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}