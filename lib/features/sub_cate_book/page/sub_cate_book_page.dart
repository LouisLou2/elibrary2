import 'package:elibapp/entity/book/book_brief_sub_cate.dart';
import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/entity/struct/sub_cate_book_signal.dart';
import 'package:elibapp/features/sub_cate_book/bloc/sub_cate_book_load_bloc.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:elibapp/shared/widget/util_widget/keep_alive_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/spec/image_widget.dart';

class SubCateBooksPage extends StatefulWidget{
  const SubCateBooksPage({super.key});
  @override
  State<SubCateBooksPage> createState()=>_CategoryBookState();
}

class _CategoryBookState extends State<SubCateBooksPage>{

  final ValueNotifier<int> _subCateIndex = ValueNotifier(0);
  late List<RefreshController> _refreshControllers;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void _handleListenEvent(SubCateBookLoadState state, int value) {
    switch (state) {
      case SubCateBookLoadState.refreshingNet:
        _refreshControllers[value].requestRefresh(needMove: true, needCallback: false);
        break;
      case SubCateBookLoadState.loadingMore:
        _refreshControllers[value].requestLoading(needMove: true, needCallback: false);
        break;
      case SubCateBookLoadState.refreshedNet:
        _refreshControllers[value].refreshCompleted();
        break;
      case SubCateBookLoadState.loadedMore:
        _refreshControllers[value].loadComplete();
        break;
      case SubCateBookLoadState.refreshNetFailed:
        _refreshControllers[value].refreshFailed();
        break;
      case SubCateBookLoadState.loadMoreFailed:
        _refreshControllers[value].loadFailed();
        break;
      default:
        throw Exception('Unknown state: $state');
    }
  }

  @override
  Widget build(BuildContext context){

    SubCateBookSignal signal = ModalRoute.of(context)!.settings.arguments as SubCateBookSignal;
    List<BookCate> subCates = signal.subCates;
    _refreshControllers = List.generate(subCates.length, (index) => RefreshController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          onPressed: () => NavigationHelper.pop(),
        ),
        title: Text(
          signal.parentCate.cateName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Wrap(
              runSpacing: -20,
              children: List.generate(
                subCates.length, (index) => ValueListenableBuilder<int>(
                  valueListenable: _subCateIndex,
                  builder: (context, value, _) => TextButton(
                    onPressed: () => _subCateIndex.value = index,
                    child: value == index ? Text(
                      subCates[index].cateName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ):
                    Text(
                      subCates[index].cateName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            child: Divider(
              color: Theme.of(context).dividerColor,
              thickness: 0.8,
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _subCateIndex,
            builder: (context, value, _ ) => KeepAliveWrapper(
              key: ValueKey(subCates[value].cateId),
              child: BlocProvider(
                key: ValueKey(subCates[value].cateId),
                create: (context) => SubCateBookLoadBloc(subCates[value].cateId),
                lazy: false,
                child: BlocConsumer<SubCateBookLoadBloc, SubCateBookLoadState>(
                  key: ValueKey(subCates[value].cateId),
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
                  listener: (context, state) => _handleListenEvent(state, value),
                  builder: (context, state) {
                    switch (state) {
                      case SubCateBookLoadState.loadingNowNoData:
                        return const Center(
                          child: CircularProgressIndicator(),
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
                              controller: _refreshControllers[value],
                              onRefresh: () => context.read<SubCateBookLoadBloc?>()?.add(SubCateBookLoadEvent.reqRefresh),
                              onLoading: () => context.read<SubCateBookLoadBloc?>()?.add(SubCateBookLoadEvent.reqLoadMore),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}