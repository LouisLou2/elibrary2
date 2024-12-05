import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/features/browse/data/hit_category_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../hit_category_repo.dart';

class HitCateRepoImpl implements HitCateRepo {

  final HitCategoryData _hitCategoryData = GetIt.I.get<HitCategoryData>();

  List<BookCate>? _hitSubcates;

  @override
  List<BookCate> get currentHitSubcates => _hitSubcates!;

  @override
  Future<bool> resetHitSubcatesNet(int num) async {
    Res<List<BookCate>> res = await _hitCategoryData.getHitSubCategoryList(num);
    if (res.isSuccess) {
      _hitSubcates = res.data;
      return true;
    }
    return false;
  }

}