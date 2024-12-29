import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/page/try_reload_page.dart';
import 'package:elibapp/shared/widget/forward_title.dart';
import 'package:elibapp/shared/widget/invisible_expanded_header.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:elibapp/shared/widget/spec/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../entity/book/book_brief_abs.dart';
import '../../../entity/book/book_cate.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/info_display/desc_bottomsheet.dart';
import '../../../shared/widget/util_widget/read_more_text.dart';
import '../../../style/ui_color.dart';
import '../bloc/hit_cate_detail_bloc.dart';

class HitCateDetail extends StatefulWidget {
  const HitCateDetail({super.key});

  @override
  State<HitCateDetail> createState() => _HitCateDetailState();
}

class _HitCateDetailState extends State<HitCateDetail> {

  late final RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int cateId = ModalRoute.of(context)!.settings.arguments as int;
    // int cateId = 5001;

    return BlocProvider(
      create: (context) => HitCateDetailBloc(cateId),
      child: BlocConsumer<HitCateDetailBloc, HitCateDetailState>(
        listenWhen: (previous, current){
          return current == HitCateDetailState.loadingMoreFailed
              || current == HitCateDetailState.loadedMore
              || current == HitCateDetailState.loadedMoreAndAllData
              || current == HitCateDetailState.loadedAndAllData;
        },
        buildWhen: (previous, current){
          return current == HitCateDetailState.loadingNowNoData
              || current == HitCateDetailState.retry
              || current == HitCateDetailState.loaded
              || current == HitCateDetailState.loadedAndAllData;
        },
        listener: (context, state) {
          switch(state){
            case HitCateDetailState.loadingMoreFailed:
              _refreshController.loadFailed();
              break;
            case HitCateDetailState.loadedMore:
              _refreshController.loadComplete();
              break;
            case HitCateDetailState.loadedMoreAndAllData:
              _refreshController.loadNoData();
              break;
            case HitCateDetailState.loadedAndAllData:
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _refreshController.loadNoData();
              });
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          switch(state){
            case HitCateDetailState.loadingNowNoData:
              return const Center(child: CircularProgressIndicator());
            case HitCateDetailState.retry:
              return TryReloadPage(
                title: AppStrs.youOffline,
                subtitle: AppStrs.tryReconnect,
                onReload: () => context.read<HitCateDetailBloc>().add(HitCateDetailEvent.reqRetry),
              );
            case HitCateDetailState.loaded:
            case HitCateDetailState.loadedAndAllData:

              HitCateDetailBloc bloc = context.read<HitCateDetailBloc>();
              BookCate cate = bloc.cate;
              List<BookBriefAbs> hitBooks = bloc.books;
              return Scaffold(
                appBar: null,
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: SmartRefresher(
                  physics: const BouncingScrollPhysics(),
                  enablePullDown: false,
                  enablePullUp: context.read<HitCateDetailBloc>().hasMoreData,
                  header: const WaterDropHeader(),
                  footer: const ClassicFooter(),
                  controller: _refreshController,
                  onLoading: () => context.read<HitCateDetailBloc>().add(HitCateDetailEvent.reqLoadMore),
                  child: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: <Widget>[
                      SliverAppBar(
                        pinned: true,
                        snap: false,
                        floating: false,
                        expandedHeight: 350.0,
                        automaticallyImplyLeading: false,
                        surfaceTintColor: Colors.transparent,
                        leading: IconButton(
                          padding: const EdgeInsets.only(left: 10),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          color: UiColor.bwChooseUsingRGB(color: Color(cate.domColor), threshold: 0.5),
                          onPressed: () => NavigationHelper.pop(context),
                        ),
                        title: InvisibleExpandedHeader(
                            child: Text(
                              cate.cateName,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          titlePadding: const EdgeInsets.only(left: 40, bottom: 10),
                          background: Stack(
                            children: <Widget>[
                              getCustomCachedImage(
                                url: cate.coverUrl,
                                width: MediaQuery.sizeOf(context).width,
                                height: 390,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Color(cate.domColor).withOpacity(0.2),
                                      Color(cate.domColor).withOpacity(0.9),
                                      Color(cate.domColor),
                                    ],
                                    stops: const [0.6, 0.75, 1],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: InkWell(
                                  onTap: () => onTapShowDescButton(cate.desc),
                                  child: SizedBox(
                                    width: MediaQuery.sizeOf(context).width - 20,
                                    child: ReadMoreText(
                                      cate.desc,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: UiColor.bwChooseUsingRGB(color: Color(cate.domColor), threshold: 0.7),
                                      ),
                                      trimMode: TrimMode.Line,
                                      trimLines: 2,
                                      colorClickableText: Colors.pink,
                                      trimCollapsedText: '全文',
                                      isExpandable: false,
                                      moreStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (hitBooks.isNotEmpty)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 0, 5),
                            child: SpecTextWidget.mediumTitle(
                              text: '热门书籍',
                              context: context,
                            ),
                          ),
                        ),
                      BlocBuilder<HitCateDetailBloc, HitCateDetailState>(
                        buildWhen: (previous, current){
                          return current == HitCateDetailState.loadedMore
                              || current == HitCateDetailState.loadedMoreAndAllData;
                        },
                        builder: (context, state) {
                          HitCateDetailBloc bloc = context.read<HitCateDetailBloc>();
                          List<BookBriefAbs> books = bloc.books;
                          return SliverFixedExtentList.builder(
                            itemExtent: 120.0,
                            itemCount: books.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ImageTile(
                                key: ValueKey(books[i].isbn),
                                padding: const EdgeInsets.fromLTRB(16, 10, 10, 0),
                                title: books[i].title,
                                subTitle: books[i].authorNamesStr,
                                thirdTitle: books[i].publisherName,
                                image: getCustomCachedImage(
                                  url: books[i].coverMUrl,
                                  width: 74,
                                ),
                                withDivider: true,
                                backgroundColor: Theme.of(context).colorScheme.surface,
                                titleWeight: FontWeight.w500,
                                subtitleColor: Theme.of(context).colorScheme.primary,
                                onTap: () => NavigationHelper.toBookView(isbn: books[i].isbn, coverUrl: books[i].coverMUrl),
                                fontSize: 18,
                                fontSize3: 13,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            default:
              throw Exception('Unknown state: $state');
          }
        },
      ),
    );
  }

  void onTapShowDescButton(String descFull){
    showDescBottomSheet(
      context: context,
      title: '简介',
      desc: descFull,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }
}