import 'package:elibapp/entity/book/book_cate.dart';

class SubCateBookSignal{
  final BookCate parentCate;
  final List<BookCate> subCates;

  SubCateBookSignal(this.parentCate, this.subCates);
}