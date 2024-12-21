
import 'package:elibapp/entity/book/book_brief_abs.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../entity/publisher/pub_with_booklis.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../pub_info_data.dart';

class PubInfoDataImpl extends PubInfoData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<BookBriefAbs>>> getPubBooks(int pubId, int num, int offset) async{
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.pub.pubBooks,
      method: HttpMethod.GET,
      data: {
        'pubId': pubId,
        'num': num,
        'offset': offset,
      }
    );
    if (!res.isSuccess) return res.to<List<BookBriefAbs>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<BookBriefAbs> books = (resp.data as List<dynamic>).map((e) => BookBriefAbs.fromJson(e)).toList();
      return Res.successWithData(books);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  Future<Res<PubWithBookLis>> getPubWithBooks(int pubId, int bookNum) async {
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.pub.infoOnePub,
      method: HttpMethod.GET,
      data: {
        'pubId': pubId,
        'bookNum': bookNum,
      }
    );
    if (!res.isSuccess) return res.to<PubWithBookLis>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      PubWithBookLis pub = PubWithBookLis.fromJson(resp.data);
      return Res.successWithData(pub);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}