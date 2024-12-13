import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/features/categories/data/cate_data.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/book/simple_user_owned_book.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';

class CateDataImpl implements CateData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<BookCate>>> getBookcates() async{
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.bookCate.allCates,
      method: HttpMethod.GET,
      data: {},
    );
    if (!res.isSuccess) return res.to<List<BookCate>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<BookCate> bookCates = (resp.data as List<dynamic>).map((e) => BookCate.fromJson(e)).toList();
      return Res.successWithData(bookCates);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  void saveBookcates(List<BookCate> bookCates) {
    DBManager.db.writeTxn(
      () async{
        DBManager.db.bookCates.putAll(bookCates);
      }
    );
  }

  @override
  List<BookCate> getBookCatesLocal() {
    List<BookCate> bookCates = DBManager.db
        .bookCates
        .where()
        .sortByCateId()
        .findAllSync();
    return bookCates;
  }
}