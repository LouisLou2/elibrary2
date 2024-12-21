import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../../../../common/http_method.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../viewing_history_data.dart';

class ViewingHistoryDataImpl extends ViewingHistoryData {
  final Requester _requester = GetIt.I<Requester>();

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

  @override
  Future<Res<List<BookViewingHistory>>> getVBHistNetByKeyword(String keyword, int pageNum, int pageSize) async{
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.hist.bvHist,
      method: HttpMethod.GET,
      data: {
        "keyword": keyword,
        "pageNum": pageNum,
        "pageSize": pageSize,
      },
    );
    if (!res.isSuccess) return res.to<List<BookViewingHistory>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<BookViewingHistory> records = (resp.data as List<dynamic>).map((e) => BookViewingHistory.fromJson(e)).toList();
      return Res.successWithData(records);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}