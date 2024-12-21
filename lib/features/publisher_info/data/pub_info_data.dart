import 'package:elibapp/entity/book/book_brief_abs.dart';

import '../../../entity/publisher/pub_with_booklis.dart';
import '../../../entity/struct/res.dart';

abstract class PubInfoData{
  Future<Res<List<BookBriefAbs>>> getPubBooks(int authorId, int num, int offset);
  Future<Res<PubWithBookLis>> getPubWithBooks(int authorId,int bookNum);
}