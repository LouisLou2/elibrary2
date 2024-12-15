import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/book/book_brief_sub_cate.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../common/http_method.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../sub_cate_book_data.dart';

class SubCateBookDataImpl extends SubCateBookData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  List<BookBriefSC> getBookBriefsLocal(int subCateId, int num) {
    return DBManager.db.bookBriefSCs
        .where()
        .subCateIdEqualToAnyOrder(subCateId)
        .sortByOrder()
        .limit(num)
        .findAllSync();
  }

  @override
  Future<Res<List<BookBriefSC>>> getBookBriefsNet(int subCateId, int offset, int num) async{
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.bookInfo.subCateBooks,
      method: HttpMethod.GET,
      data: {
        'subCateId': subCateId,
        'offset': offset,
        'num': num,
      },
    );
    if (!res.isSuccess) return res.to<List<BookBriefSC>>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      List<BookBriefSC> books = (resp.data as List<dynamic>).map((e) => BookBriefSC.fromJson(e)).toList();
      BookBriefSC.setOrderAndCateForList(books, offset, subCateId);
      return Res.successWithData(books);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  void saveBookBriefs(List<BookBriefSC> bookBriefs) {
    DBManager.db.writeTxn(
      () async {
        await DBManager.db.bookBriefSCs.putAll(bookBriefs);
      },
    );
  }

}