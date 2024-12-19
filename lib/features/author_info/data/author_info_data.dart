import 'package:elibapp/entity/author/author_with_booklis.dart';
import 'package:elibapp/entity/book/book_brief_abs.dart';

import '../../../entity/struct/res.dart';

abstract class AuthorInfoData{
  Future<Res<List<BookBriefAbs>>> getAuthorBooks(int authorId, int num, int offset);
  Future<Res<AuthorWithBookLis>> getAuthorWithBooks(int authorId,int bookNum);
}