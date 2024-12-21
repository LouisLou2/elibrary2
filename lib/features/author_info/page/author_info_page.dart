import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/page/try_reload_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../entity/author/author.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/info_display/desc_bottomsheet.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../style/ui_size.dart';
import '../bloc/author_info_bloc.dart';

class AuthorInfoPage extends StatefulWidget{
  const AuthorInfoPage({super.key});

  @override
  State<StatefulWidget> createState()=>_AuthorPageState();
}

class _AuthorPageState extends State<AuthorInfoPage>{

  late final RefreshController _refreshController;

  @override
  void initState(){
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose(){
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    // 从路由中获取参数
    int authorId = ModalRoute.of(context)?.settings.arguments as int;
    return BlocProvider(
      create: (context) => AuthorInfoBloc(authorId),
      child: BlocBuilder<AuthorInfoBloc, AuthorInfoState>(
        buildWhen: (previous, current){
          return current == AuthorInfoState.retry
              || current == AuthorInfoState.loading
              || current == AuthorInfoState.loaded;
        },
        builder: (context, state){
          if(state == AuthorInfoState.loading){
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  onPressed: ()=>NavigationHelper.pop(context),
                ),
                toolbarHeight: 50,
                surfaceTintColor: Colors.transparent,
              ),
              resizeToAvoidBottomInset: false,
              body: const Center(child: CircularProgressIndicator()),
            );
          }else if(state == AuthorInfoState.retry){
            return TryReloadPage(
              onReload: (BuildContext con) => context.read<AuthorInfoBloc?>()?.add(AuthorInfoEvent.reqReloadNowNoData),
            );
          }else if(state == AuthorInfoState.loaded){
            Author author = context.read<AuthorInfoBloc>().author;
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  onPressed: ()=>NavigationHelper.pop(context),
                ),
                toolbarHeight: 50,
                surfaceTintColor: Colors.transparent,
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SearchBar(
                    hintText: '搜索${author.name}的作品',
                    hintStyle: WidgetStateProperty.all(
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      minHeight: 40,
                    ),
                    backgroundColor: WidgetStateProperty.all(Theme.of(context).hoverColor),
                    elevation: WidgetStateProperty.all(0),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SmartRefresher(
                    physics: const BouncingScrollPhysics(),
                    controller: _refreshController,
                    onLoading: ()=>context.read<AuthorInfoBloc?>()?.add(AuthorInfoEvent.reqLoadMore),
                    enablePullDown: false,
                    enablePullUp: context.read<AuthorInfoBloc>().hasMore,
                    header: const ClassicHeader(),
                    footer: const ClassicFooter(),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: UiSize.gap.mediumGap),
                        Material(
                          borderRadius: BorderRadius.circular(UiSize.border.largeBorderR),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(UiSize.border.largeBorderR),
                            ),
                            child: InkWell(
                              onTap: ()=>onTapAuthorTile(author.desc),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                                        child: Text(
                                          author.name,
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            color: Theme.of(context).colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        author.name,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      subtitle: const Text(
                                        '作者',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: FilledButton(
                                        style: ButtonStyle(
                                          backgroundColor: WidgetStateProperty.all(CupertinoColors.systemBlue),
                                          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
                                          shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(UiSize.border.largerBorderR),
                                            ),
                                          ),
                                        ),
                                        onPressed: (){},
                                        child: Text(
                                          '关注',
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                      child: Text(
                                        author.desc.isEmpty ? '暂无简介' : author.desc,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Theme.of(context).colorScheme.outline,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: UiSize.gap.largeGap),
                        Container(
                          padding: const EdgeInsets.only(bottom: 15,top: 15, left: 15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(UiSize.border.largeBorderR),
                          ),
                          child: BlocConsumer<AuthorInfoBloc, AuthorInfoState>(
                            listenWhen: (previous, current){
                              return current == AuthorInfoState.loadingMore
                                  || current == AuthorInfoState.loadedMore
                                  || current == AuthorInfoState.loadMoreError
                                  || current == AuthorInfoState.loadNoMore;
                            },
                            listener: (context, state){
                              switch(state){
                                case AuthorInfoState.loadingMore:
                                  _refreshController.requestLoading(needMove: true, needCallback: false);
                                  break;
                                case AuthorInfoState.loadedMore:
                                  _refreshController.loadComplete();
                                  break;
                                case AuthorInfoState.loadMoreError:
                                  _refreshController.loadFailed();
                                  break;
                                case AuthorInfoState.loadNoMore:
                                  _refreshController.loadNoData();
                                  break;
                                default:
                                  break;
                              }
                            },
                            buildWhen: (previous, current){
                              return current == AuthorInfoState.loadedMore || current == AuthorInfoState.loadNoMore;
                            },
                            builder: (context, state){
                              List<BookBriefAbs> books = context.read<AuthorInfoBloc>().books;
                              return books.isEmpty? Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '暂无作品',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              )
                              : Column(
                                children: List.generate(books.length+1,
                                 (i){
                                  if(i == 0){
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child:Text(
                                        '全部作品',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                    );
                                  }
                                  return ImageTile(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                    title: books[i-1].title,
                                    subTitle: '作者 | ${books[i-1].authorNamesStr}',
                                    thirdTitle: '评分 | ${books[i-1].rating}',
                                    image: getCustomCachedImage(
                                      url: books[i-1].coverSUrl,
                                      width: 65,
                                      height: 90,
                                    ),
                                    actionWidget: Chip(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      side: BorderSide.none,
                                      avatar: Icon(
                                        CupertinoIcons.star_fill,
                                        size: 15,
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                      elevation: 10,
                                      label: Text(
                                        '7668',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: 10,
                                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                                        ),
                                      ),
                                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                    ),
                                    titleWeight: FontWeight.w500,
                                    onTap: (){},
                                    fontSize: 18,
                                    fontSize3: 12,
                                  );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                )
              ),
            );
          }
          throw Exception('未知的状态');
        },
      ),
    );
  }

  void onTapAuthorTile(String desc){
    showDescBottomSheet(
      context: context,
      title: '作者简介',
      desc: desc,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }
}