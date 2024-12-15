import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';

abstract class RBDetailRepo {
  Future<ResCodeEnum> getRBDetail(int reserveId);

  RBDetail get currentDetail;
}