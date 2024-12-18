import 'package:elibapp/entity/search/search_hist.dart';

abstract class SearchHistData {
  List<String> getSearchHistory(int userId,int num);
  void addSearchHistory(SearchHist hist);
  void clearSearchHistory();
}