import 'package:elibapp/entity/book/book_signal.dart';
import 'package:elibapp/features/book_view/bloc/book_view_event.dart';
import 'package:elibapp/features/book_view/bloc/book_view_state.dart';
import 'package:elibapp/features/book_view/page/book_view_loading.dart';
import 'package:elibapp/features/book_view/repo/impl/book_view_repo_impl.dart';
import 'package:elibapp/features/book_view/widget/three_stack.dart';
import 'package:elibapp/shared/page/try_reload_page.dart';
import 'package:elibapp/shared/widget/custom_filled_button.dart';
import 'package:elibapp/util/format_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entity/book/book_info.dart';
import '../../../helper/nav/navigation_helper.dart';
import '../../../shared/widget/beautify_widget/fliter_widget.dart';
import '../../../shared/widget/box_groov.dart';
import '../../../shared/widget/image_card_with_info.dart';
import '../../../shared/widget/info_display/desc_bottomsheet.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../shared/widget/spec/text_widget.dart';
import '../../../shared/widget/text_action_widget.dart';
import '../../../style/ui_size.dart';
import '../../../util/extension/core_extension.dart';
import '../bloc/book_view_bloc.dart';
import '../repo/book_view_repo.dart';

class BookViewPage extends StatefulWidget{
  const BookViewPage({super.key});
  @override
  State<BookViewPage> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookViewPage>{

  void invokeReqNet(BuildContext con){
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 100), () {
        con.read<BookViewBloc?>()?.add(BookViewEvent.reqNet);
      });
    });
  }

  @override
  Widget build(BuildContext context){

    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2view book build invoked');
    // 读取页面参数
    BookSignal bookSignal = ModalRoute.of(context)!.settings.arguments as BookSignal;
    // BookSignal bookSignal = const BookSignal(isbn: '000100039X',coverUrl: 'http://192.168.127.252:9022/elib/book_cover/pics/00/06/49/000649885X.jpg',);
    Color primaryColor = Theme.of(context).colorScheme.primary;

    BookViewRepo repo = BookViewRepoImpl();
    BookViewBloc bloc = BookViewBloc(bookSignal.isbn, bookSignal.coverUrl, repo);

    return RepositoryProvider.value(
      value: repo,
      child: BlocProvider.value(
        value: bloc,
        child: BlocBuilder<BookViewBloc, BookViewState>(
          buildWhen: (previous, current) => previous != current && current is! BookRetrievedNoData,
          builder: (BuildContext context, state) {
            print('@@@@@@@@@@@@@@@@@@@@state is $state');
            if (state is BookViewInitNoData || state is BookViewInitWithLocal){
              invokeReqNet(context);
            }
            if (state is BookViewInitNoData) return BookViewLoadingPage(coverUrl: state.cover);
            if (state is BookViewRetry) {
              return TryReloadPage(
                 onReload: (BuildContext con) => con.read<BookViewBloc?>()?.add(BookViewEvent.reqBeginFromNoData),
              );
            }
            if (state is BookViewRefresh || state is BookViewInitWithLocal) {
              BookInfo? bookInfo = context.read<BookViewRepo>().getCurrentBookInfo();
              assert (bookInfo != null);
              return Scaffold(
                extendBodyBehindAppBar: true, // must set to true
                extendBody: true,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(45),
                  child: FilterWidget(
                    sigmaX: 18, sigmaY: 18,
                    child: AppBar(
                      systemOverlayStyle: null,
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      title: Text(
                        bookInfo!.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: -0.6,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () => NavigationHelper.pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: primaryColor,
                        ),
                      ),
                      actions: [
                        IconButton(onPressed: null,
                          icon: Icon(
                            Icons.add,
                            color: primaryColor,
                          ),
                        ),
                        IconButton(onPressed: null,
                          icon: Icon(
                            Icons.more_vert,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: state is! BookViewRefresh ? null : BottomAppBar(
                  elevation: 5,
                  surfaceTintColor: Colors.transparent,
                  color: Theme.of(context).colorScheme.background,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: customFilledButton(
                          context: context,
                          text: bookInfo.hasEbook ? '在线阅读' : '无线上资源',
                          textColor: bookInfo.hasEbook ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
                          vPadding: 10,
                          backgroundColor: bookInfo.hasEbook ? Theme.of(context).focusColor : Theme.of(context).disabledColor,
                          onPressed: bookInfo.hasEbook ? (){} : null,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: customFilledButton(
                          context: context,
                          text: bookInfo.libAvailable ? '借阅' : '无法借阅',
                          textColor: bookInfo.libAvailable ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
                          vPadding: 10,
                          backgroundColor: bookInfo.libAvailable ? Theme.of(context).focusColor : Theme.of(context).disabledColor,
                          onPressed: bookInfo.libAvailable ? (){
                            NavigationHelper.toBookingPage(bookInfo);
                          } : null,
                        ),
                      ),
                    ],
                  ),
                ),
                body: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: UiSize.padding.largePadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(top:35,bottom: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).shadowColor.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(2),
                                child: getCustomCachedImage(
                                  url: bookInfo.coverMUrl,
                                  width: 150,
                                  height: 212,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              bookInfo.title,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.7,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          getAuthorButton(
                            ids: bookInfo.authorIds,
                            names: bookInfo.authorNames,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildKindWidget(bookInfo.category1Name),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '信息',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              letterSpacing: -0.8,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ThreeStack(
                              title: '评分',
                              thirdTitle: '来自GoodRead',
                              color: primaryColor,
                              valueWidget: Text(
                                '${bookInfo.rating}',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.7,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            ThreeStack(
                              title: '作者',
                              thirdTitle: '更多信息',
                              color: primaryColor,
                              valueWidget: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: primaryColor,
                                size: 33,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            ThreeStack(
                              title: '字数',
                              thirdTitle: '${FormatTool.dateScaleStr(bookInfo.pubDate)} 出版',
                              color: primaryColor,
                              valueWidget: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${bookInfo.wordCount}',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.7,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    '千字',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.8,
                                      fontSize: 13,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            ThreeStack(
                              title: '版权信息',
                              thirdTitle: bookInfo.publisherName,
                              color: primaryColor,
                              valueWidget: Icon(
                                Icons.copyright,
                                color: primaryColor,
                                size: 33,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '简介',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              letterSpacing: -0.8,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Divider(
                            height: 15,
                            thickness: 1.0,
                            indent: 0,
                            endIndent: 0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SelectionArea(
                            child: Text(
                              bookInfo.desc,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                letterSpacing: -0.8,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: ()=>onTapshowDescButton(bookInfo.desc),
                            child: Text(
                              '展开',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                letterSpacing: -0.8,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    state is! BookViewRefresh ? const SizedBox():
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '资源',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              letterSpacing: -0.8,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Divider(
                            height: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          BoxGroove(
                            title: '可借阅的图书馆',
                            titleColor: Theme.of(context).colorScheme.primary,
                            titleFontSize: 16,
                            widgets: ListExtension.separate<Widget>(
                              len: bookInfo.availableLibs!.length,
                              separatorGenerator: (index)=> const SizedBox(width: 10),
                              generator: (index)=>_buildAvailableWidget(item: bookInfo.availableLibs![index].name,context: context),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextActionWidget(
                            surfaceColor: Theme.of(context).colorScheme.primary,
                            onTap: null,
                            text: SpecTextWidget.smallTitle(
                              text:'向其他读者借阅',
                              context: context,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: BoxGroove(
                         title: '更多${bookInfo.authorNames[0]}作品',
                          widgets: List.generate(bookInfo.relatedBooks!.length,
                            (i) => ImageInfoBox(
                              image: getCustomCachedImage(
                                url: bookInfo.relatedBooks![i].coverSUrl,
                                width: 130,
                                height: 180,
                              ),
                              title: bookInfo.relatedBooks![i].title,
                              fontSize: 16, maxWidth: 130,
                              onTap: () => NavigationHelper.toBookView(isbn: bookInfo.relatedBooks![i].isbn, coverUrl: bookInfo.relatedBooks![i].coverMUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildKindWidget(String kind){
    return Row(
      children: [
        Icon(
          Icons.done_all,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          kind,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            letterSpacing: -0.7,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
  Widget _buildAvailableWidget({required String item,required BuildContext context, bool isAvailable = true}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isAvailable ? Theme.of(context).colorScheme.primary:Theme.of(context).disabledColor,
      ),
      child: Row(
        children: [
          Icon(
            isAvailable ? Icons.done : Icons.close,
            color: Theme.of(context).colorScheme.surface,
          ),
          const SizedBox(width: 5),
          Text(
            item,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface
            ),
          ),
        ],
      ),
    );
  }

  void onTapshowDescButton(String descFull){
    showDescBottomSheet(
      context: context,
      title: '书籍简介',
      desc: descFull,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }

  Widget getAuthorButton({required List<int> ids, required List<String> names}){
    return Align(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
            ids.length * 2 - 1, (index){
          if(index.isEven){
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){},
              child: Text(
                names[index~/2],
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.7,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          }
          return Text(
            '/',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          );
        }
        ),
      ),
    );
  }
}