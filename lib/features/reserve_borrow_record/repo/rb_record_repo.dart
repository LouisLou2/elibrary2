import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/common/res_enum.dart';

import '../../../entity/reserve_borrow/reserve_borrow_brief.dart';

abstract class RBRecordRepo {
  Future<ResCodeEnum> refreshNetAndPersist(int num, RBRecordType type);
  Future<ResCodeEnum> loadMoreNetAndPersist(int num, RBRecordType type);
  bool initRecordsLocal(int num, RBRecordType type);
  List<ReserveBorrowBrief> getCurrentRecords(RBRecordType type);
  bool hasRefreshedNet(RBRecordType type);
}