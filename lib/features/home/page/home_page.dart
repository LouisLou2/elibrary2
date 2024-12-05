import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/features/chart/const/chart_type.dart';
import 'package:elibapp/features/global_aggreement/const/const_shared_widget.dart';
import 'package:elibapp/features/home/bloc/home_page_bloc.dart';
import 'package:elibapp/features/home/bloc/home_page_event.dart';
import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/home/repo/home_page_repo.dart';
import 'package:elibapp/features/home/widget/detail_book_reco_card.dart';
import 'package:elibapp/features/home/widget/reco_books_pane.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/custom_filled_button.dart';
import 'package:elibapp/shared/widget/image_with_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../entity/book/book_brief_hr.dart';
import '../../../entity/book/book_brief_reco.dart';
import '../../../entity/book/book_brief_tb.dart';
import '../../../shared/widget/box_groov.dart';
import '../../../shared/widget/forward_title.dart';
import '../../../shared/widget/image_card_with_info.dart';
import '../../../shared/widget/info_display/headline2.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../style/ui_size.dart';
import '../../../util/format_tool.dart';
import '../bloc/home_page_state.dart';
import '../widget/RecoBooksPaneController2.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key,});
  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  late RecoBooksPaneController2 controller;
  final RefreshController refreshController = RefreshController();

  Future? _future;
  bool canFlip = true;


  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;

  // 获取新推荐书籍卡片
  Future<List<Widget>> getNewRecoBookCards() async{
    var res = await GetIt.I<HomePageRepo>().retriveNewRecoAndSave();
    if (res.isEmpty){
      return [];
    }
    assert (res.length == HomeUiStrategy.recoBooksReqNum);
    return fromRecoBooks(res, context);
  }

  List<Widget> fromRecoBooks(List<BookBriefReco> recoBooks, BuildContext aContext){
    List<Widget> res = [];
    for (int i = 0; i < recoBooks.length -1; i++){
      res.add(
        InkWell(
          onTap: ()=>NavigationHelper.toBookView(isbn: recoBooks[i].isbn, coverUrl: recoBooks[i].coverMUrl),
          child: Card(
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(aContext).dividerColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(UiSize.border.tinyBorderR),
            ),
            child: getCustomCachedImage(url: recoBooks[i].coverSUrl),
          ),
        )
      );
    }
    res.add(
      DetailBookRecoCard(
        book: recoBooks.last,
        onTap: ()=>NavigationHelper.toBookView(isbn: recoBooks.last.isbn, coverUrl: recoBooks.last.coverMUrl),
      )
    );
    return res;
  }

  void initBookRecoPaneController(BuildContext aContext){
    List<BookBriefReco> recoBooks = GetIt.I<HomePageRepo>().getCurrentReco();
    assert( recoBooks.length == HomeUiStrategy.recoBooksReqNum);
    controller = RecoBooksPaneController2(
      fromRecoBooks(recoBooks,aContext),
      getNewRecoBookCards,
    );
  }

  void prepareRefreshForLocalInit(BuildContext aContext){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1),(){
        aContext.read<HomePageBloc>().add(HomePageEvent.reqRefresh);
      });
    });
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context){

    initBookRecoPaneController(context);

    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: RepositoryProvider.value(
          value: GetIt.I<HomePageRepo>(),
          child: BlocListener<HomePageBloc, HomePageState>(
            listenWhen: (previous, current) => current is HomePageRefresh || current is HomePageError || current is HomePageLoading,
            listener: (context, state){
              if (state is HomePageRefresh){
                refreshController.refreshCompleted();
                return;
              }
              if (state is HomePageError){
                refreshController.refreshFailed();
                return;
              }
              if (state is HomePageLoading){
                refreshController.requestRefresh(needMove: true, needCallback: false);
                return;
              }
            },
            child: SmartRefresher(
              physics: const BouncingScrollPhysics(),
              enablePullDown: true,
              header: ConstSharedWidget.classicRefreshHeader,
              footer: ConstSharedWidget.classicRefreshFooter,
              controller: refreshController,
              onRefresh: () {
                context.read<HomePageBloc>().add(HomePageEvent.reqRefresh);
              },
              child: SingleChildScrollView(
                child: BlocConsumer<HomePageBloc, HomePageState>(
                  listenWhen: (previous, current) => current is HomePageRefreshLocal,
                  buildWhen: (previous, current) => current is HomePageRefresh, // 只有刷新完成时才会重绘
                  listener: (context, state) => prepareRefreshForLocalInit(context),
                  builder: (context, state) {

                    if (state is HomePageRefreshLocal){
                      prepareRefreshForLocalInit(context);
                    }

                    // 获取重绘需要的资料
                    HomePageRepo repo = context.read<HomePageRepo>();
                    List<BookViewingHistory> viewingHistory = repo.getCurrentViewed();
                    List<BookBriefTB> tbBooks = repo.getCurrentTB();
                    List<BookBriefHR> hrBooks = repo.getCurrentHR();
                    return Column(
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                              child: IconButton(
                                onPressed: ()=>NavigationHelper.toAnnounList(),
                                icon: Icon(
                                  Icons.notifications_active_outlined,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                          child: HeadLine2(
                            title: AppStrs.read,
                            size: 37,
                          ),
                        ),
                        const Divider(height: 6, thickness: 1, indent: 14, endIndent: 14,),
                        SizedBox(height: UiSize.gap.mediumGap,),
                        buildViewingHistory(viewingHistory),
                        SizedBox(height: UiSize.gap.largeGap,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: ForwardTitle(
                                title: AppStrs.recomend,
                                size: 18,
                                onTap: (){},
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: UiSize.gap.mediumGap,),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.78,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: RecoBooksPane(controller: controller),
                          ),
                        ),
                        SizedBox(height: UiSize.gap.mediumGap,),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: customFilledButton(
                                  context: context,
                                  text: '换一批',
                                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                  textColor: Theme.of(context).colorScheme.tertiary,
                                  onPressed: () {
                                    print('tapped: $canFlip');
                                    if (canFlip){
                                      canFlip = false;
                                      _future = controller.flip();
                                      _future!.then((value) => canFlip = true);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        ...buildTrendingChartSection(tbBooks),
                        const SizedBox(height: 20,),
                        ...buildHighRatingChartSection(hrBooks),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildViewingHistory(List<BookViewingHistory> viewingHistory){
    return Padding(
      padding: const EdgeInsets.only(left:10),
      child: BoxGroove(
        title: AppStrs.recentlyViewed,
        titleFontSize: 18,
        titleOnTap: (){},
        widgets: List.generate(
          viewingHistory.length,
          (i) => ImageWithNameCard(
            onTap: () => NavigationHelper.toBookView(isbn: viewingHistory[i].isbn, coverUrl: viewingHistory[i].coverMUrl),
            image: getCustomCachedImage(
              url: viewingHistory[i].coverMUrl,
              width: 140,
              height: 198,
            ),
            nameBarColor: Color(viewingHistory[i].coverDomColor),
            fontSize: 11,
            text: viewingHistory[i].title,
          ),
        ),
      ),
    );
  }

  List<Widget> buildTrendingChartSection(List<BookBriefTB> books){
    Widget groove = Padding(
      padding: const EdgeInsets.only(left:14),
      child: BoxGroove(
        title: "图书趋势榜",
        titleFontSize: 18,
        titleOnTap: ()=>NavigationHelper.toBookChart(ChartType.Trending),
        widgets:List.generate(
          books.length,
          (i) => ImageInfoBox(
            image: getCustomCachedImage(
              url: books[i].coverSUrl,
              width: 110,
              height: 155,
            ),
            title: books[i].title,
            fontSize: 12,
            maxWidth: 110,
            onTap: ()=>NavigationHelper.toBookView(isbn: books[i].isbn, coverUrl: books[i].coverMUrl),
          ),
        ),
      ),
    );
    Widget button = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: customFilledButton(
              context: context,
              text: '查看更多',
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              textColor: Theme.of(context).colorScheme.tertiary,
              onPressed: ()=>NavigationHelper.toBookChart(ChartType.Trending),
            ),
          ),
        ),
      ],
    );
    Widget gap = SizedBox(height: UiSize.gap.mediumGap);
    return [groove, gap, button];
  }

  List<Widget> buildHighRatingChartSection(List<BookBriefHR> books){
    Widget groove = Padding(
      padding: const EdgeInsets.only(left:14),
      child: BoxGroove(
        titleFontSize: 18,
        title: "高分图书榜",
        titleOnTap: ()=>NavigationHelper.toBookChart(ChartType.HighlyRated),
        widgets:List.generate(
          books.length,
           (i) => ImageInfoBox(
            image: getCustomCachedImage(
              url: books[i].coverSUrl,
              width: 110,
              height: 155,
            ),
            title: FormatTool.trimText(books[i].title,maxLength: 15),
            fontSize: 16,
            maxWidth: 110,
            onTap: ()=>NavigationHelper.toBookView(isbn: books[i].isbn, coverUrl: books[i].coverMUrl),
          ),
        ),
      ),
    );
    Widget button = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: customFilledButton(
              context: context,
              text: '查看更多',
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              textColor: Theme.of(context).colorScheme.tertiary,
              onPressed: ()=>NavigationHelper.toBookChart(ChartType.HighlyRated),
            ),
          ),
        ),
      ],
    );
    Widget gap = SizedBox(height: UiSize.gap.mediumGap);
    return [groove, gap, button];
  }
}