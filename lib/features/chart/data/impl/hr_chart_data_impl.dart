import 'package:elibapp/entity/book/book_brief_hr.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../chart_data.dart';

class HRChartDataImpl implements ChartData {
  
  @override
  List<BookBriefHR> getChartDataLocal(int pageNum, int pageSize) {
    return DBManager.db.bookBriefHRs
        .where()
        .sortByOrder()
        .offset(pageNum * pageSize)
        .limit(pageSize)
        .findAllSync();
  }

  @override
  void persistChartData(covariant List<BookBriefHR> chartEntityList) {
    DBManager.db.writeTxn(
          () async {
        // 清除现有数据
        await DBManager.db.bookBriefHRs.putAll(chartEntityList);
      },
    );
  }
}