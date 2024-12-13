import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/app_strings.dart';
import '../../../entity/book/book_cate.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../../../shared/widget/gradient_image_card.dart';
import '../../../shared/widget/info_display/headline2.dart';
import '../../../shared/widget/section_window.dart';
import '../bloc/hit_cate_bloc.dart';
import '../repo/hit_category_repo.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> with AutomaticKeepAliveClientMixin {

  late SearchController _searchController;
  late FocusNode _focusNode;


  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _searchController = SearchController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    child: IconButton(
                      onPressed:  (){},
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
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: HeadLine2(
                  title: AppStrs.browse,
                  size: 37,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                child: Hero(
                  tag: 'browsePage:searchBar',
                  child: SearchBar(
                    controller: _searchController,
                    autoFocus: false,
                    focusNode: _focusNode,
                    hintText: '搜索书名, 作者, 出版社',
                    hintStyle: Theme.of(context).textTheme.titleSmall!=null? MaterialStatePropertyAll<TextStyle>(
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ):null,
                    side: WidgetStatePropertyAll<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    shadowColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                    backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.primary.withOpacity(0.18)),
                    surfaceTintColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    elevation: const WidgetStatePropertyAll<double>(3.0),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onTap: (){
                      // SearchHandler.enterSearchPage();
                      _focusNode.unfocus();
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Search by scanning barcode',
                        child: IconButton(
                          icon: const Icon(Icons.document_scanner_outlined), onPressed: () {  },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RepositoryProvider.value(
                value: GetIt.I.get<HitCateRepo>(),
                child: BlocProvider(
                  create: (context) => HitCateBloc(),
                  child: BlocBuilder<HitCateBloc,HitCateState>(
                    builder: (context,state){
                      if (state == HitCateState.loading) {
                        return Padding(
                          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3.5),
                          child: const Center(
                              child: CircularProgressIndicator()
                          ),
                        );
                      } else if (state == HitCateState.retry) {
                        return Padding(
                          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 3.5),
                          child: Center(
                            child: ReloadWidget(
                              tile: AppStrs.youOffline,
                              subtitle: AppStrs.tryReconnect,
                              onReload: () => context.read<HitCateBloc?>()?.add(HitCateEvent.reqReloadFromRetry),
                            ),
                          ),
                        );
                      } else if (state == HitCateState.loaded) {
                        final HitCateRepo repo = GetIt.I.get<HitCateRepo>();
                        final List<BookCate> hitSubcates = repo.currentHitSubcates;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                          child: SectionWindow(
                            title:  AppStrs.hotKind,
                            fontSize: 22,
                            titleOnTap: NavigationHelper.toCategoryPage,
                            actionOnTap: NavigationHelper.toCategoryPage,
                            actionText: AppStrs.viewAll,
                            widgets: List.generate(hitSubcates.length,
                                (i) {
                              BookCate cate = hitSubcates[i];
                              return GradientImageCard(
                                color: Color(cate.domColor),
                                image: getCustomCachedImage(
                                  url: cate.coverUrl,
                                  width: 200,
                                  height: 300,
                                ),
                                text: cate.cateName,
                                onTap: () {},
                              );
                            }
                            ),
                          )
                        );
                      }
                      throw Exception('state not found');
                    },
                  )
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}