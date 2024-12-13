import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/book/book_cate.dart';

abstract class CateRepo{
  List<BookCate> get currentCategories1;
  List<BookCate> getCurrentSubCates(int parentId);
  Future<ResCodeEnum> getFromNetAndPersist();
  bool initFromLocal();
}