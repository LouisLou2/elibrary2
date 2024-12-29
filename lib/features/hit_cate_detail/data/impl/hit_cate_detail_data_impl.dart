import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/entity/book/cate_detail.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../hit_cate_detail_data.dart';

class HitCateDetailDataImpl implements HitCateDetailData {

  final Requester _requester = GetIt.I.get<Requester>();

  @override
  Future<Res<CateDetail>> getHitCateDetail(int cateId, int num) async {
    Res<Resp> res = await _requester.standardRequestNoAuth(
      NetworkPathCollector.bookCate.subCateDetail,
      HttpMethod.GET,
      {
        'cateId': cateId,
        'num': num,
      }
    );
    if (!res.isSuccess) return res.to<CateDetail>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      CateDetail data = CateDetail.fromJson(resp.data);
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  Future<Res<List<BookBriefAbs>>> getHitSubCateBooks(int cateId, int offset, int num) async {
    Res<Resp> res = await _requester.standardRequestNoAuth(
      NetworkPathCollector.bookCate.subCateHitBooks,
      HttpMethod.GET,
      {
        'cateId': cateId,
        'offset': offset,
        'num': num,
      }
    );
    if (!res.isSuccess) return res.to<List<BookBriefAbs>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<BookBriefAbs> data = (resp.data as List<dynamic>).map((e) => BookBriefAbs.fromJson(e)).toList();
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }
}