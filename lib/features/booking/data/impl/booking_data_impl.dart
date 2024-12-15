import 'package:elibapp/entity/lib/lib_time_span.dart';
import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../booking_data.dart';

class BookingDataImpl extends BookingData {

  final Requester _requester = GetIt.I<Requester>();


  @override
  Future<Res<List<LibTimeSpan>>> getLibTimeSpanList(String isbn) async{
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.rb.timeSpans,
      method: HttpMethod.GET,
      data: {
        'isbn': isbn
      },
    );
    if (!res.isSuccess) return res.to<List<LibTimeSpan>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<LibTimeSpan> spanList = (resp.data as List<dynamic>).map((e) => LibTimeSpan.fromJson(e)).toList();
      return Res.successWithData(spanList);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  Future<Res<RBDetail>> book(int libId, String isbn, DateTime pickUpTime) async{
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.rb.reserve,
      method: HttpMethod.POST,
      data: {
        'lib_id': libId,
        'isbn': isbn,
        'pick_up_time': pickUpTime.toString(),
      },
    );
    if (!res.isSuccess) return res.to<RBDetail>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      RBDetail detail = RBDetail.fromJson(resp.data);
      return Res.successWithData(detail);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}