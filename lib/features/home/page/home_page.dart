
import 'package:card_swiper/card_swiper.dart';
import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/features/home/bloc/home_page_bloc.dart';
import 'package:elibapp/features/home/bloc/home_page_event.dart';
import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/home/repo/home_page_repo.dart';
import 'package:elibapp/features/home/widget/detail_book_reco_card.dart';
import 'package:elibapp/features/home/widget/reco_books_pane.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../entity/book/book_brief_hr.dart';
import '../../../entity/book/book_brief_reco.dart';
import '../../../entity/book/book_brief_tb.dart';
import '../../../shared/widget/Image_card_with_info.dart';
import '../../../shared/widget/box_groov.dart';
import '../../../shared/widget/card_layout.dart';
import '../../../shared/widget/custom_image_card.dart';
import '../../../shared/widget/info_display/headline2.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../shared/widget/spec/text_widget.dart';
import '../../../style/ui_size.dart';
import '../../../util/format_tool.dart';
import '../bloc/home_page_state.dart';
import '../widget/reco_books_pane_controller.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key,});
  @override
  State<HomePage> createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{

  late RecoBooksPaneController controller;
  final RefreshController refreshController = RefreshController();

  Future? _future;
  bool canFlip = true;

  // 获取新推荐书籍卡片
  Future<List<Widget>> getNewRecoBookCards() async{
    var res = await GetIt.I<HomePageRepo>().retriveNewRecoAndSave();
    if (res.isEmpty){
      return [];
    }
    assert (res.length == HomeUiStrategy.recoBooksReqNum);
    return fromRecoBooks(res);
  }

  List<Widget> fromRecoBooks(List<BookBriefReco> recoBooks){
    List<Widget> res = [];
    for (int i = 0; i < recoBooks.length -1; i++){
      res.add(
        InkWell(
          onTap: () => print('tapped'),
          child: getCustomCachedImage(url: recoBooks[i].coverSUrl),
        )
      );
    }
    res.add(
      DetailBookRecoCard(
        book: recoBooks.last,
        onTap: ()=> print('tapped'),
      )
    );
    return res;
  }

  void initBookRecoPaneController(){
    List<BookBriefReco> recoBooks = GetIt.I<HomePageRepo>().getCurrentReco();
    assert( recoBooks.length == HomeUiStrategy.recoBooksReqNum);
    controller = RecoBooksPaneController(
      fromRecoBooks(recoBooks),
      getNewRecoBookCards,
    );
  }


  @override
  void initState() {
    super.initState();
    initBookRecoPaneController();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: RepositoryProvider.value(
          value: GetIt.I<HomePageRepo>(),
          child: BlocListener<HomePageBloc, HomePageState>(
            listener: (context, state){
              assert(state is HomePageRefresh || state is HomePageRefresh || state is HomePageError || state is HomePageLoading);
              if (state is HomePageRefresh){
                refreshController.refreshCompleted();
                return;
              }
              if (state is HomePageError){
                refreshController.refreshFailed();
                return;
              }
              if (state is HomePageLoading){
                refreshController.requestLoading();
                return;
              }
            },
            child: SmartRefresher(
              enablePullDown: true,
              header: const ClassicHeader(
                refreshingText: '正在刷新',
                releaseText: '释放刷新',
                completeText: '刷新完成',
                idleText: '下拉刷新',
              ),
              footer: const ClassicFooter(),
              controller: refreshController,
              onRefresh: () async {
                context.read<HomePageBloc>().add(HomePageEvent.reqRefresh);
              },
              child: SingleChildScrollView(
                child: BlocBuilder<HomePageBloc, HomePageState>(
                  buildWhen: (previous, current){
                    // 在首次创建时，buildWhen并不会被考虑
                    return current is HomePageRefresh;
                  }, // 只有刷新完成时才会重绘
                  builder: (context, state) {
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
                                onPressed: () {
                                  //NavigationHelper.pushNamed(RouteCollector.notification_page);
                                },
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
                        const Divider(
                          height: 6,
                          thickness: 1,
                          indent: 14,
                          endIndent: 14,
                        ),
                        const SizedBox(height: UiSize.mediumGap,),
                        buildViewingHistory(viewingHistory),
                        const SizedBox(height: 20,),
                        Text(
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                          AppStrs.recomend,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 700,
                          child: GestureDetector(
                            onTap: () {
                              print('tapped: $canFlip');
                              if (canFlip){
                                canFlip = false;
                                _future = controller.flip();
                                _future!.then((value) => canFlip = true);
                              }
                            },
                            child: RecoBooksPane(controller: controller),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ...buildTrendingChartSection(tbBooks),
                        const SizedBox(
                          height: 20,
                        ),
                        ...buildHighRatingChartSection(hrBooks),
                        Padding(
                          padding: const EdgeInsets.only(left:10),
                          child: BoxGroove(
                            title: Text(
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                              AppStrs.activity,
                            ),
                            titleOnTap: ()=>print('tt'),
                            widgets:List.generate(5,
                                  (index) => CardLayout(
                                image: Image.network(
                                  'https://img1.baidu.com/it/u=3715471658,3948653362&fm=253&fmt=auto&app=120&f=JPEG?w=390&h=520',
                                  fit: BoxFit.cover,
                                  width: 320,
                                  height: 160,
                                ),
                                title: '校本部图书馆读书会',
                                subTitle: '2024.5.1-2024.5.5',
                                fontSize: 18,
                                action: FilledButton(
                                  onPressed: ()=>print('查看详情'),
                                  child: const Text(
                                    '查看详情',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                          child: GestureDetector(
                            onTap: null,
                            child: Row(
                              children: [
                                SpecTextWidget.mediumTitle(
                                  text: '看点新鲜',
                                  context: context,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 380,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: getCustomCachedImage(
                                  url: 'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                                ),
                              );
                            },
                            itemCount: 3,
                            itemWidth: 290.0,
                            layout: SwiperLayout.STACK,
                          ),
                        ),
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
        title: Text(
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
          AppStrs.recentlyViewed,
        ),
        titleOnTap: ()=> print('tt'),
        widgets: List.generate(
          viewingHistory.length,
          (index) => CustomImageCard(
            surfaceColor: Colors.white,
            onTap: ()=> {},
            image: getCustomCachedImage(
              url: viewingHistory[index].coverMUrl,
              width: 140,
              height: 180,
            ),
            fontSize: 16,
            text: viewingHistory[index].title,
          ),
        ),
      ),
    );
  }

  List<Widget> buildTrendingChartSection(List<BookBriefTB> books){
    Widget groove = Padding(
      padding: const EdgeInsets.only(left:14),
      child: BoxGroove(
        title: Text(
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
          "图书趋势榜"
        ),
        titleOnTap: ()=> print('tt'),
        widgets:List.generate(
          books.length,
          (i) => ImageInfoBox(
            image: getCustomCachedImage(
              url: books[i].coverSUrl,
              width: 140,
              height: 180,
            ),
            title: FormatTool.trimText(books[i].title,maxLength: 15),
            fontSize: 16,
            onTap: (){

            },
          ),
        ),
      ),
    );
    Widget button = ElevatedButton(
      onPressed: (){},
      child: Text(
        "查看更多",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
      ),
    );
    return [groove,button];
  }

  List<Widget> buildHighRatingChartSection(List<BookBriefHR> books){
    Widget groove = Padding(
      padding: const EdgeInsets.only(left:14),
      child: BoxGroove(
        title: Text(
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
            "图书趋势榜"
        ),
        titleOnTap: ()=> print('tt'),
        widgets:List.generate(
          books.length,
              (i) => ImageInfoBox(
            image: getCustomCachedImage(
              url: books[i].coverSUrl,
              width: 140,
              height: 180,
            ),
            title: FormatTool.trimText(books[i].title,maxLength: 15),
            fontSize: 16,
            onTap: (){

            },
          ),
        ),
      ),
    );
    Widget button = ElevatedButton(
      onPressed: (){},
      child: Text(
        "查看更多",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),
      ),
    );
    return [groove,button];
  }
}