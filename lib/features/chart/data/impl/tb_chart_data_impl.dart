import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../chart_data.dart';

class TBChartDataImpl implements ChartData {
  @override
  List<BookBriefTB> getChartDataLocal(int pageNum, int pageSize) {
    return DBManager.db.bookBriefTBs
        .where()
        .sortByOrder()
        .offset(pageNum * pageSize)
        .limit(pageSize)
        .findAllSync();
  }

  @override
  void persistChartData(covariant List<BookBriefTB> chartEntityList) {
    DBManager.db.writeTxn(
      () async {
        // 清除现有数据
        await DBManager.db.bookBriefTBs.putAll(chartEntityList);
      },
    );
  }
}