import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';

class RBDetailSignal{
  bool directlyUseDetail;
  int reserveId;
  RBDetail? detail;

  RBDetailSignal(this.reserveId): directlyUseDetail = false;
  RBDetailSignal.useDetail(this.detail): directlyUseDetail = true, reserveId = detail!.reserveId;
}