import 'package:elibapp/entity/book/book_cate.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../hit_category_data.dart';

class HitCategoryDataImpl implements HitCategoryData {

  final Requester _requester = GetIt.I.get<Requester>();

  @override
  Future<Res<List<BookCate>>> getHitSubCategoryList(int num) async{
    Res<Resp> res = await _requester.standardRequestNoAuth(
        NetworkPathCollector.bookCate.hitSubCates,
        HttpMethod.GET,
        {
          'num': num,
        }
    );
    if (!res.isSuccess) return res.to<List<BookCate>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<BookCate> data = (resp.data as List<dynamic>).map((e) => BookCate.fromJson(e)).toList();
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }
}