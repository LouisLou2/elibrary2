import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/book/book_brief_from_author.dart';
import 'package:elibapp/entity/book/book_info.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/features/author/export/author_export_api.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../book_view_data.dart';

class BookViewDataImpl extends BookViewData {

  final Requester _requester = GetIt.I<Requester>();
  final AuthorExportApi _authorExportApi = GetIt.I<AuthorExportApi>();

  @override
  BookInfo? getBookInfoLocal(String isbn, int relatedBookNum) {
    BookInfo? bookInfo = DBManager.db
        .bookInfos
        .where()
        .isbnEqualTo(isbn)
        .findFirstSync();
    if (bookInfo == null) return null;
    assert (bookInfo.authorIds.isNotEmpty);
    int desiredAuthorId = bookInfo.authorIds.first;
    List<BookBriefFromAuthor> relatedBooks = _authorExportApi.getBooksFromAuthorLocal(desiredAuthorId, relatedBookNum);
    bookInfo.relatedBooks = relatedBooks;
    return bookInfo;
  }

  @override
  Future<Res<BookInfo>> getBookInfoNet(String isbn, int relatedBookNum) async {
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp?> res = await _requester.req(
      path: NetworkPathCollector.bookInfo.infoOneIsbnCountBehavior,
      method: HttpMethod.GET,
      data: {
        'isbn': isbn,
        'relatedBookNum': relatedBookNum,
      }
    );
    if (!res.isSuccess) return res.to<BookInfo>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      BookInfo book = BookInfo.fromJson(resp.data);
      book.processInternal();
      return Res.successWithData(book);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  void persistBookInfo(BookInfo bookInfo) {
    DBManager.db.writeTxn(
      () async {
        assert(bookInfo.internalProcessedOrNull());
        DBManager.db.bookInfos.put(bookInfo);
      },
    );
    if (bookInfo.relatedBooks != null) {
      _authorExportApi.saveBooksFromAuthor(bookInfo.relatedBooks!);
    }
  }

}