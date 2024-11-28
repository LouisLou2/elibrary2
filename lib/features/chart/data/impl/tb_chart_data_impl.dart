import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../chart_data.dart';

class TBChartDataImpl implements ChartData {

  final Requester _requester = GetIt.I<Requester>();

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

  @override
  Future<Res<List<BookBriefTB>>> getChartDataRemote(int pageNum, int pageSize) async {
    Res<Resp?> res = await _requester.standardRequestNoAuth(
      NetworkPathCollector.bookChart.trendingBooks,
      HttpMethod.GET,
      {
        'pageNum': pageNum,
        'pageSize': pageSize,
      }
    );
    if (!res.isSuccess) return res.to<List<BookBriefTB>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<BookBriefTB> data = (resp.data as List<dynamic>).map((e) => BookBriefTB.fromJson(e)).toList();
      BookBriefTB.setOrderForList(data, pageNum * pageSize);
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }
}