import 'package:elibapp/entity/book/book_brief_sub_cate.dart';

import '../../../entity/struct/res.dart';

abstract class SubCateBookData {
  List<BookBriefSC> getBookBriefsLocal(int subCateId, int num);
  Future<Res<List<BookBriefSC>>> getBookBriefsNet(int subCateId, int offset, int num);
  void saveBookBriefs(List<BookBriefSC> bookBriefs);
}