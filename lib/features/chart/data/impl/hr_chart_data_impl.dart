import 'package:elibapp/entity/book/book_brief_hr.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../chart_data.dart';

class HRChartDataImpl implements ChartData {

  final Requester _requester = GetIt.I<Requester>();
  
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

  @override
  Future<Res<List<BookBriefHR>>> getChartDataRemote(int pageNum, int pageSize) async {
    Res<Resp?> res = await _requester.standardRequestNoAuth(
        NetworkPathCollector.bookChart.highRatingBooks,
        HttpMethod.GET,
        {
          'pageNum': pageNum,
          'pageSize': pageSize,
        }
    );
    if (!res.isSuccess) return res.to<List<BookBriefHR>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<BookBriefHR> data = (resp.data as List<dynamic>).map((e) => BookBriefHR.fromJson(e)).toList();
      BookBriefHR.setOrderForList(data, pageNum * pageSize);
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }
}