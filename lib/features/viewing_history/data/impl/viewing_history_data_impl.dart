import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../viewing_history_data.dart';

class ViewingHistoryDataImpl extends ViewingHistoryData {

  @override
  List<BookViewingHistory> getViewingHistoryLocal(int pageNum, int pageSize, int userId) {
    return DBManager.db.bookViewingHistorys
        .where()
        .userIdEqualTo(userId)
        .sortByViewingTimeDesc()
        .offset(pageNum * pageSize)
        .limit(pageSize)
        .findAllSync();
  }

  @override
  void saveViewingHistory(List<BookViewingHistory> hisList) {
    DBManager.db.writeTxn(
       () async {
        await DBManager.db.bookViewingHistorys.putAll(hisList);
      },
    );
  }

}