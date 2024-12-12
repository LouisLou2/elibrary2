import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/book/simple_user_owned_book.dart';
import 'package:elibapp/features/shelf/data/shelf_data.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';

class ShelfDataImpl implements ShelfData{

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<SimpleUserOwnedBook>>> getShelfBooksNet(int offset, int num) async {
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _requester.req(
        path: NetworkPathCollector.bookShelf.books,
        method: HttpMethod.GET,
        data: {
          'offset': offset,
          'num': num,
        }
    );
    if (!res.isSuccess) return res.to<List<SimpleUserOwnedBook>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<SimpleUserOwnedBook> books = (resp.data as List).map((e) => SimpleUserOwnedBook.fromJson(e)).toList();
      return Res.successWithData(books);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  List<SimpleUserOwnedBook> getShelfBooksLocal(int userId,int offset, int num) {
    List<SimpleUserOwnedBook> books = DBManager.db.simpleUserOwnedBooks
    .where()
    .userIdEqualToAnyTime(userId)
    .sortByTimeDesc()
    .offset(offset)
    .limit(num)
    .findAllSync();
    return books;
  }

  @override
  void saveShelfBooks(List<SimpleUserOwnedBook> books) {
    DBManager.db.writeTxn(
      () async{
        DBManager.db.simpleUserOwnedBooks.putAll(books);
      }
    );
  }

}