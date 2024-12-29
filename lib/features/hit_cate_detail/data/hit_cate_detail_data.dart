import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/book/cate_detail.dart';
import '../../../entity/struct/res.dart';

abstract class HitCateDetailData{
  Future<Res<List<BookBriefAbs>>> getHitSubCateBooks(int cateId, int offset, int num);
  Future<Res<CateDetail>> getHitCateDetail(int cateId, int num);
}