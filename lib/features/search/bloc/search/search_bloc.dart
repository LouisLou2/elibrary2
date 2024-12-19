import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/common/search_type.dart';
import 'package:elibapp/entity/search/searched_author.dart';
import 'package:elibapp/entity/search/searched_book.dart';
import 'package:elibapp/entity/search/searched_publisher.dart';
import 'package:elibapp/entity/search/searched_result.dart';
import 'package:elibapp/features/search/bloc/search/search_event.dart';
import 'package:elibapp/features/search/bloc/search/search_state.dart';
import 'package:elibapp/features/search/const/search_ui_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../entity/struct/res.dart';
import '../../data/search_data.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final SearchData _searchData = GetIt.I<SearchData>();

  List<SearchedResult> results = [];
  int pageNum = 0;
  SearchInType inType = SearchInType.books;
  String keyword = '';

  SearchBloc(this.inType, this.keyword) : super(SearchState.loadingRes) {
    on<ReqSearch>((event, emit) async{
      assert(event.keyword.isNotEmpty);
      if (event.ignoreIfSame && keyword==event.keyword) {
        return;
      }
      keyword = event.keyword;
      pageNum = 0;
      _doFirstSearch(keyword);
    });

    on<ReqSearchAgain>((event, emit) async {
      _doFirstSearch(keyword);
    });

    on<ReqLoadMore>((event, emit) async {
      emit(SearchState.loadingMore);
      ResCodeEnum resCode = await _search(keyword, false, pageNum+1);
      if (resCode == ResCodeEnum.Success) {
        ++pageNum;
        emit(SearchState.loadedMore);
      } else {
        emit(SearchState.loadMoreError);
      }
    });
  }

  Future<void> _doFirstSearch(String keyword) async {
    emit(SearchState.loadingRes);
    ResCodeEnum resCode = await _search(keyword, true, pageNum);
    if (resCode == ResCodeEnum.Success) {
      emit(SearchState.loadedRes);
    } else {
      emit(SearchState.retry);
    }
  }

  bool notSame(String keyword) {
    return this.keyword != keyword;
  }

  Future<ResCodeEnum> _search(String keyword, bool refreshOrAdd, reqPageNum) async {
      switch (inType) {
        case SearchInType.books:
          Res<List<SearchedBook>> res = await _searchData.searchInBooks(
              keyword, reqPageNum, SearchUiStrategy.pageSize);
          if (res.isSuccess) {
            if (refreshOrAdd) {
              results = res.data!;
            } else {
              results.addAll(res.data!);
            }
          }
          return res.code;
        case SearchInType.authors:
          Res<List<SearchedAuthor>> res = await _searchData.searchInAuthors(
              keyword, reqPageNum, SearchUiStrategy.pageSize);
          if (res.isSuccess) {
            if (refreshOrAdd) {
              results = res.data!;
            } else {
              results.addAll(res.data!);
            }
          }
          return res.code;
        case SearchInType.publishers:
          Res<List<SearchedPublisher>> res = await _searchData.searchInPublishers(
              keyword, reqPageNum, SearchUiStrategy.pageSize);
          if (res.isSuccess) {
            if (refreshOrAdd) {
              results = res.data!;
            } else {
              results.addAll(res.data!);
            }
          }
          return res.code;
      }
    }
  }