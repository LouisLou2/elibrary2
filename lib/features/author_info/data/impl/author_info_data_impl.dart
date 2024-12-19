
import 'package:elibapp/entity/author/author_with_booklis.dart';

import 'package:elibapp/entity/book/book_brief_abs.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../author_info_data.dart';

class AuthorInfoDataImpl extends AuthorInfoData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<BookBriefAbs>>> getAuthorBooks(int authorId, int num, int offset) async{
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.author.authorBooks,
      method: HttpMethod.GET,
      data: {
        'authorId': authorId,
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
  Future<Res<AuthorWithBookLis>> getAuthorWithBooks(int authorId, int bookNum) async {
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.author.infoOneAuthor,
      method: HttpMethod.GET,
      data: {
        'authorId': authorId,
        'bookNum': bookNum,
      }
    );
    if (!res.isSuccess) return res.to<AuthorWithBookLis>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      AuthorWithBookLis author = AuthorWithBookLis.fromJson(resp.data);
      return Res.successWithData(author);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}