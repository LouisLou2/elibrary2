

import 'package:elibapp/entity/book/simple_user_owned_book.dart';
import 'package:elibapp/features/shelf/bloc/shelf_load_bloc.dart';
import 'package:elibapp/features/shelf/repo/shelf_repo.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../../../shared/widget/info_display/headline2.dart';
import '../../global_aggreement/const/const_shared_widget.dart';


class ShelfPage extends StatefulWidget {
  const ShelfPage({super.key});

  @override
  State<ShelfPage> createState() => _ShelfPageState();
}

class _ShelfPageState extends State<ShelfPage> {

  final RefreshController _refreshController = RefreshController();
  final GlobalKey<TooltipState> tooltipkey=GlobalKey<TooltipState>();

  bool isSelecting = false;
  List<bool> selectedItems = List.generate(100, (index) => false); // 初始每个项都未选中

  void toggleSelection(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });
  }

  void enterMultiSelectMode() {
    setState(() {
      isSelecting = true;
    });
  }

  void exitMultiSelectMode() {
    setState(() {
      isSelecting = false;
      selectedItems = List.generate(20, (index) => false); // 清除所有选中状态
    });
  }


  void _listenLoadState(BuildContext aContext,ShelfLoadState state){
    switch(state){
      case ShelfLoadState.refreshingNet:
        _refreshController.requestRefresh(needMove: true, needCallback: false);
        break;
      case ShelfLoadState.loadingMoreNet:
        _refreshController.requestLoading(needMove: true, needCallback: false);
        break;
      case ShelfLoadState.refreshNetSuccess:
        _refreshController.refreshCompleted();
        break;
      case ShelfLoadState.loadedMoreNet:
        _refreshController.loadComplete();
        break;
      case ShelfLoadState.refreshNetFailure:
        _refreshController.refreshFailed();
        break;
      case ShelfLoadState.loadedMoreFailure:
        _refreshController.loadFailed();
        break;
      default:
        throw Exception('state not found');
    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: UiSize.iconText.iconSmall,
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.only(right: 12),
                  child: IconButton(
                    onPressed: ()=>showPullDownMenu(
                      context: context,
                      items: [
                        PullDownMenuItem(
                          onTap: () {},
                          title: '添加',
                          icon: CupertinoIcons.add,
                          iconColor: Theme.of(context).colorScheme.primary,
                        ),
                        PullDownMenuItem(
                          onTap: () {},
                          title: '编辑',
                          icon: CupertinoIcons.pen,
                        ),
                        PullDownMenuItem(
                          title: '分享',
                          subtitle: 'Share in different channel',
                          onTap: () {},
                          icon: CupertinoIcons.arrowshape_turn_up_right,
                        ),
                        PullDownMenuItem(
                          onTap: () {},
                          title: '暂时关闭',
                          icon: CupertinoIcons.xmark_circle,
                        ),
                        PullDownMenuItem(
                          onTap: () {},
                          title: '清空',
                          isDestructive: true,
                          icon: CupertinoIcons.delete,
                        ),
                      ],
                      position: Rect.fromPoints(const Offset(400,80), const Offset(500,0)),
                    ),
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: UiSize.iconText.iconSmall,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              child: HeadLine2(
                title: AppStrs.myLib,
                size: 37,
                icon: Tooltip(
                  key: tooltipkey,
                  message: AppStrs.publicSpec,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
                  ),
                  textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    size: 30,
                  ),
                ),
                onTap: ()=>tooltipkey.currentState?.ensureTooltipVisible(),
              ),
            ),
            const Divider(
              height: 8,
              thickness: 1.5,
              indent: 20,
            ),
            const SizedBox(height: 10,),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 0),
                child: RepositoryProvider.value(
                  value: GetIt.I<ShelfRepo>(),
                  child: BlocProvider(
                    create: (context)=>ShelfLoadBloc(),
                    lazy: false,
                    child: BlocConsumer<ShelfLoadBloc,ShelfLoadState>(
                      listenWhen: (previous,current){
                        return
                          current == ShelfLoadState.refreshingNet ||
                          current == ShelfLoadState.loadingMoreNet||
                          current == ShelfLoadState.refreshNetSuccess ||
                          current == ShelfLoadState.loadedMoreNet ||
                          current == ShelfLoadState.refreshNetFailure ||
                          current == ShelfLoadState.loadedMoreFailure;
                      },
                      buildWhen: (previous,current){
                        return current == ShelfLoadState.refreshingNetNowNoData ||
                            current == ShelfLoadState.retry||
                            current == ShelfLoadState.refreshLocal ||
                            current == ShelfLoadState.refreshNetSuccess ||
                            current == ShelfLoadState.loadedMoreNet;
                      },
                      listener: (context,state) => _listenLoadState(context,state),
                      builder: (context,state){
                        if (state == ShelfLoadState.retry){
                          return Center(
                            child: ReloadWidget(
                              onReload: () => context.read<ShelfLoadBloc?>()?.add(ShelfLoadEvent.reqNetRefresh),
                            ),
                          );
                        }
                        if (state == ShelfLoadState.refreshingNetNowNoData){
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (state == ShelfLoadState.refreshLocal ||
                            state == ShelfLoadState.refreshNetSuccess ||
                            state == ShelfLoadState.loadedMoreNet){
                          List<SimpleUserOwnedBook> books = context.read<ShelfRepo>().currentBooks;
                          return SmartRefresher(
                            physics: const BouncingScrollPhysics(),
                            enablePullDown: true,
                            enablePullUp: true,
                            header: ConstSharedWidget.classicRefreshHeader,
                            footer: ConstSharedWidget.classicRefreshFooter,
                            controller: _refreshController,
                            onRefresh: ()=> context.read<ShelfLoadBloc?>()?.add(ShelfLoadEvent.reqNetRefresh),
                            onLoading: ()=> context.read<ShelfLoadBloc?>()?.add(ShelfLoadEvent.reqNetLoadMore),
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                crossAxisSpacing: 15,
                                mainAxisExtent: 160,
                                mainAxisSpacing: 15,
                              ),
                              itemCount: books.length, // 这里假设有20个项
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onLongPress: enterMultiSelectMode,
                                  onTap: isSelecting ? () => toggleSelection(i) : null,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Positioned.fill(
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            selectedItems[i] ? Colors.black38 : Colors.transparent,
                                            BlendMode.darken,
                                          ),
                                          child: getCustomCachedImage(
                                            url: books[i].coverMUrl,
                                            height: 160,
                                            width: 16/1.4,
                                          ),
                                        ),
                                      ),
                                      // 使用 ColorFiltered 添加灰色滤镜
                                      if (selectedItems[i])
                                        const Positioned(
                                          bottom: 1,
                                          right: 8,
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 32,
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}