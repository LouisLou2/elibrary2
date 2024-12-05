import 'package:elibapp/entity/book/book_cate.dart';
import '../../../entity/struct/res.dart';

abstract class HitCategoryData{
  Future<Res<List<BookCate>>> getHitSubCategoryList(int num);
}