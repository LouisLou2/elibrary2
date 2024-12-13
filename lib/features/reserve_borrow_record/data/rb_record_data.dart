import 'package:elibapp/common/reserve_borrow_enum.dart';
import 'package:elibapp/entity/reserve_borrow/reserve_borrow_brief.dart';

import '../../../entity/struct/res.dart';

abstract class RBRecordData {
  Future<Res<List<ReserveBorrowBrief>>> getRBRecordsNet(int userId, int offset, int num, {ReserveBorrowStatus? status});
  void saveRBRecords(List<ReserveBorrowBrief> records);
  List<ReserveBorrowBrief> getRBRecordsLocalOfStatus(int userId, int num, {ReserveBorrowStatus? status});
}