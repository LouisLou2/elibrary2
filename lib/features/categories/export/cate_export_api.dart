import '../../../entity/book/book_cate.dart';
import '../../../entity/struct/res.dart';

abstract class CateExportApi {
  List<BookCate> getSubCatesLocal(int parentId);
  Future<Res<List<BookCate>>> getSubCatesNet(int parentId);
}