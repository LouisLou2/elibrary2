import '../../../entity/reserve_borrow/rb_detail.dart';
import '../../../entity/struct/res.dart';

abstract class RBDetailData {
  Future<Res<RBDetail>> getRBDetail(int reserveId);
}