import 'dart:async';

import 'package:elibapp/common/search_type.dart';
import 'package:elibapp/features/search/bloc/search_control/search_control_event.dart';
import 'package:elibapp/features/search/page/searched_author_list.dart';
import 'package:elibapp/features/search/page/searched_book_list.dart';
import 'package:elibapp/features/search/page/searched_publisher_list.dart';
import 'package:elibapp/shared/widget/error/reload_widget.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/image_tile.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../bloc/search_control/search_control_bloc.dart';
import '../bloc/search_control/search_control_state.dart';

enum Condition { book, author, publisher }

class SearchPage extends StatefulWidget {
   const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  Timer? _searchThrottleTimer;
  late SearchController _searchController;
  late PageController _pageController;
  final ValueNotifier<bool> _searchHistsChanged = ValueNotifier(false);
  final ValueNotifier<SearchInType> _searchInType = ValueNotifier(SearchInType.books);

  @override
  void initState() {
    _searchController = SearchController();
    _pageController = PageController();
    super.initState();
  }
  @override
  void dispose(){
    _searchController.dispose();
    _searchThrottleTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchControlBloc(),
          lazy: false,
          child: Builder(
            builder: (con){
              return Column(
                children:[
                  Padding(
                    padding:  const EdgeInsets.fromLTRB(16, 10, 16, 0),
                    child: Hero(
                      tag: 'browsePage:searchBar',
                      child: SearchBar(
                        controller: _searchController,
                        autoFocus: true,
                        hintText: '搜索书名, 作者, 出版社',
                        hintStyle: Theme.of(context).textTheme.titleSmall!=null? WidgetStatePropertyAll<TextStyle>(
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
                        shadowColor:  const WidgetStatePropertyAll<Color>(Colors.transparent),
                        backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.primary.withOpacity(0.18)),
                        surfaceTintColor:  const WidgetStatePropertyAll<Color>(Colors.transparent),
                        padding:  const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 14.0),
                        ),
                        elevation:  const WidgetStatePropertyAll<double>(3.0),
                        shape: WidgetStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(UiSize.border.mediumBorderR),
                          ),
                        ),
                        leading:  const Icon(Icons.search),
                        trailing: <Widget>[
                          Tooltip(
                            message: 'Change brightness mode',
                            child: IconButton(
                              icon:  const Icon(Icons.document_scanner_outlined), onPressed: () {  },
                            ),
                          ),
                        ],
                        onTap: (){},
                        onChanged: (value)=> _searchThrottle(con, value),
                        onSubmitted: (value){},
                      ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchControlBloc, SearchControlState>(
                      buildWhen: (previous, current) {
                        return current is  WaitTypingNowNoInput
                            || current is InputChanged;
                      },
                      builder: (context, state) {
                        if (state is WaitTypingNowNoInput) {
                          _searchInType.value = SearchInType.books;
                          // List<String> hists = context.read<SearchControlBloc?>()?.searchHist ?? [];
                          return _buildSearchHistorySection(context);
                        }
                        if (state is InputChanged) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ValueListenableBuilder(
                                valueListenable: _searchInType,
                                builder: (context, value, child) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: CupertinoSegmentedControl<SearchInType>(
                                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                          children: {
                                            SearchInType.books: _getSegmentedItem(AppStrs.book),
                                            SearchInType.authors: _getSegmentedItem(AppStrs.author),
                                            SearchInType.publishers: _getSegmentedItem(AppStrs.publisher),
                                          },
                                          onValueChanged: (value){
                                            _searchInType.value = value;
                                            context.read<SearchControlBloc?>()?.add(SearchInTypeChanged(value));
                                            _pageController.jumpToPage(value.index);
                                          },
                                          groupValue: value,
                                          selectedColor: Theme.of(context).colorScheme.primary,
                                          unselectedColor: Theme.of(context).colorScheme.surface,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                              Expanded(
                                child: PageView(
                                  controller: _pageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    SearchedBookListPage(keyword: state.keyword, forceSearch: true,),
                                    SearchedAuthorListPage(keyword: state.keyword,forceSearch: true,),
                                    SearchedPubListPage(keyword: state.keyword,forceSearch: true,),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        throw Exception('Unknown state: $state');
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchHistorySection(BuildContext con){
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrs.searchHistory,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: (){
                  _searchHistsChanged.value = !_searchHistsChanged.value;
                  con.read<SearchControlBloc?>()?.add(SearchControlEvent.searchClear);
                },
                child: Text(
                  '清空',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _searchHistsChanged,
            builder: (context, value, child) {
              List<String> hists = con.read<SearchControlBloc?>()?.searchHist ?? [];
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(hists.length, (i) =>
                  ActionChip(
                    label: Text(
                      hists[hists.length - 1 - i],
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    onPressed: (){
                      _searchController.text = hists[hists.length - 1 - i];
                      _searchThrottle(context, hists[hists.length - 1 - i]); // TODO: 这里不需要防抖
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getSegmentedItem(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  void _searchThrottle(BuildContext con, String keyword){
    _searchThrottleTimer?.cancel();
    _searchThrottleTimer = Timer(const Duration(milliseconds: 600),
      () {
        con.read<SearchControlBloc?>()?.add(SearchInputChanged(keyword));
      }
    );
  }
}