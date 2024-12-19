import 'package:elibapp/common/search_type.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/features/search/bloc/search_control/search_control_event.dart';
import 'package:elibapp/features/search/bloc/search_control/search_control_state.dart';
import 'package:elibapp/features/search/const/search_ui_strategy.dart';
import 'package:elibapp/features/search/data/search_hist_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/search/search_hist.dart';

class SearchControlBloc extends Bloc<SearchControlEvent, SearchControlState> {

  final UserStateRepo _userStateRepo = GetIt.I<UserStateRepo>();
  final SearchHistData _searchHistData = GetIt.I<SearchHistData>();

  List<String> searchHist = [];
  SearchInType inType = SearchInType.books;
  String keyword = '';

  SearchControlBloc() : super(SearchControlState.waitTypingNowNoInput) {
    _prepareFirstEnter();
    on<SearchInputChanged>((event, emit) async{
      keyword = event.keyword;
      if (event.keyword.isEmpty) {
        emit(SearchControlState.waitTypingNowNoInput);
        return;
      }
      _storeSearchHist(keyword);
      emit(InputChanged(keyword,inType));
    });

    on<SearchInTypeChanged>((event, emit) async {
      inType = event.type;
      emit(InputChanged(keyword,inType));
    });

    on<SearchHistClear>((event, emit) async {
      searchHist.clear();
      _searchHistData.clearSearchHistory();
    });
  }

  void _prepareFirstEnter() {
    searchHist = _searchHistData.getSearchHistory(_userStateRepo.userId, SearchUiStrategy.searchHistNum);
  }

  void _storeSearchHist(String keyword) {
    _searchHistData.addSearchHistory(SearchHist(
      _userStateRepo.userId,
      keyword,
      DateTime.now(),
    ));
    // 如果搜索历史中已经有这个关键字,移动到最后
    int index = searchHist.indexOf(keyword);
    if (index != -1) {
      searchHist.removeAt(index);
      searchHist.add(keyword);
    }else{
      // 如果搜索历史中的数量已经达到上限，就删除最早的那个
      if (searchHist.length >= SearchUiStrategy.searchHistNum) {
        searchHist.removeAt(0);
      }
      // 添加新的搜索历史
      searchHist.add(keyword);
    }
  }
}