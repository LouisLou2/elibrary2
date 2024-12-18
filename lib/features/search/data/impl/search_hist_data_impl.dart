import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/search/search_hist.dart';
import 'package:isar/isar.dart';

import '../search_hist_data.dart';

class SearchHistDataImpl extends SearchHistData {
  @override
  void addSearchHistory(SearchHist hist) {
    DBManager.db.writeTxn(
     () async {
        // 清除现有数据
        await DBManager.db.searchHists.put(hist);
      },
    );
  }

  @override
  void clearSearchHistory() {
    DBManager.db.writeTxn(
     () async {
        // 清除现有数据
        await DBManager.db.searchHists.clear();
      },
    );
  }

  @override
  List<String> getSearchHistory(int userId, int num) {
    return DBManager.db.searchHists
        .where()
        .userIdEqualToAnyTime(userId)
        .sortByTimeDesc()
        .limit(num)
        .findAllSync()
        .map((e) => e.keyword)
        .toList();
  }

}