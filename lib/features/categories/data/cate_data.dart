import 'package:elibapp/entity/book/book_cate.dart';

import '../../../entity/struct/res.dart';

abstract class CateData{
  Future<Res<List<BookCate>>> getBookCates();
  void saveBookCates(List<BookCate> bookCates);
  List<BookCate> getBookCatesLocal();
}