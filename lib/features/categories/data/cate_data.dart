import 'package:elibapp/entity/book/book_cate.dart';

import '../../../entity/struct/res.dart';

abstract class CateData{
  Future<Res<List<BookCate>>> getBookcates();
  void saveBookcates(List<BookCate> bookCates);
  List<BookCate> getBookCatesLocal();
}