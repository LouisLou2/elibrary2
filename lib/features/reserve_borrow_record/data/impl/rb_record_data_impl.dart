import 'package:elibapp/common/reserve_borrow_enum.dart';

import 'package:elibapp/entity/reserve_borrow/reserve_borrow_brief.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../rb_record_data.dart';

class RBRecordDataImpl extends RBRecordData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<ReserveBorrowBrief>>> getRBRecordsNet(int userId, int offset, int num, {ReserveBorrowStatus? status}) async {
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.rb.records,
      method: HttpMethod.GET,
      data: {
        "status": status?.code,
        "offset": offset,
        "num": num,
      },
    );
    if (!res.isSuccess) return res.to<List<ReserveBorrowBrief>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<ReserveBorrowBrief> records = (resp.data as List<dynamic>).map((e) => ReserveBorrowBrief.fromJson(e)).toList();
      return Res.successWithData(records);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  void saveRBRecords(List<ReserveBorrowBrief> records) {
    DBManager.db.writeTxn(
      () async{
        DBManager.db.reserveBorrowBriefs.putAll(records);
      }
    );
  }

  @override
  List<ReserveBorrowBrief> getRBRecordsLocalOfStatus(int userId, int num, {ReserveBorrowStatus? status}) {
    late List<ReserveBorrowBrief> records;
    if (status == null) {
      records = DBManager.db
          .reserveBorrowBriefs
          .where()
          .userIdEqualToAnyStatus(userId)
          .sortByReserveTime()
          .offset(0)
          .limit(num)
          .findAllSync();
    }else {
      records = DBManager.db
          .reserveBorrowBriefs
          .where()
          .userIdStatusEqualTo(userId, status)
          .sortByReserveTime()
          .offset(0)
          .limit(num)
          .findAllSync();
    }
    return records;
  }
}