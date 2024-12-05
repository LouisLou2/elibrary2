import 'package:elibapp/entity/book/book_cate.dart';

abstract class HitCateRepo{
  List<BookCate> get currentHitSubcates;
  Future<bool> resetHitSubcatesNet(int num);
}