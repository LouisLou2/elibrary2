import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/common/res_enum.dart';

import 'package:elibapp/common/reserve_borrow_enum.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/features/reserve_borrow_record/data/rb_record_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/reserve_borrow/reserve_borrow_brief.dart';
import '../../../../entity/struct/res.dart';
import '../rb_record_repo.dart';

class RBRecordRepoImpl implements RBRecordRepo {

  final RBRecordData _data = GetIt.I<RBRecordData>();
  final UserStateRepo _user = GetIt.I<UserStateRepo>();

  bool _hasRefreshedNetAll = false;
  bool _hasRefreshedNetWaitingPickUp = false;
  bool _hasRefreshedNetWaitingReturn = false;

  final List<ReserveBorrowBrief>_allRecords = [];
  final List<ReserveBorrowBrief>_waitingPickUpRecords = [];
  final List<ReserveBorrowBrief>_waitingReturnRecords = [];


  @override
  Future<ResCodeEnum> refreshNetAndPersist(int num, RBRecordType type) async {
    ReserveBorrowStatus? status;
    switch (type) {
      case RBRecordType.All:
        status = null;
        Res<List<ReserveBorrowBrief>> res = await _data.getRBRecordsNet(_user.userId, 0, num, status: status);
        if (res.code == ResCodeEnum.Success) {
          _allRecords.clear();
          for (var element in res.data!) {
            element.setUserId(_user.userId);
          }
          _allRecords.addAll(res.data!);
          _hasRefreshedNetAll = true;
          //save to local
          _data.saveRBRecords(res.data!);
        }
        return res.code;
      case RBRecordType.WaitingPickup:
        status = ReserveBorrowStatus.WaitingPickUp;
        Res<List<ReserveBorrowBrief>> res = await _data.getRBRecordsNet(_user.userId, 0, num, status: status);
        if (res.code == ResCodeEnum.Success) {
          _waitingPickUpRecords.clear();
          for (var element in res.data!) {
            element.setUserId(_user.userId);
          }
          _waitingPickUpRecords.addAll(res.data!);
          _hasRefreshedNetWaitingPickUp = true;
          _data.saveRBRecords(res.data!);
        }
        return res.code;
      case RBRecordType.WaitingReturn:
        status = ReserveBorrowStatus.WaitingReturn;
        Res<List<ReserveBorrowBrief>> res = await _data.getRBRecordsNet(_user.userId, 0, num, status: status);
        if (res.code == ResCodeEnum.Success) {
          _waitingReturnRecords.clear();
          for (var element in res.data!) {
            element.setUserId(_user.userId);
          }
          _waitingReturnRecords.addAll(res.data!);
          _hasRefreshedNetWaitingReturn = true;
          _data.saveRBRecords(res.data!);
        }
        return res.code;
    }
  }

  @override
  List<ReserveBorrowBrief> getCurrentRecords(RBRecordType type) {
    switch (type) {
      case RBRecordType.All:
        return _allRecords;
      case RBRecordType.WaitingPickup:
        return _waitingPickUpRecords;
      case RBRecordType.WaitingReturn:
        return _waitingReturnRecords;
    }
  }

  @override
  bool initRecordsLocal(int num, RBRecordType type) {
    ReserveBorrowStatus? status;
    switch (type) {
      case RBRecordType.All:
        status = null;
      case RBRecordType.WaitingPickup:
        status = ReserveBorrowStatus.WaitingPickUp;
      case RBRecordType.WaitingReturn:
        status = ReserveBorrowStatus.WaitingReturn;
    }
    List<ReserveBorrowBrief> lis =  _data.getRBRecordsLocalOfStatus(_user.userId, num, status: status);
    if (lis.isEmpty) {
      return false;
    } else {
      switch (type) {
        case RBRecordType.All:
          _allRecords.addAll(lis);
          break;
        case RBRecordType.WaitingPickup:
          _waitingPickUpRecords.addAll(lis);
          break;
        case RBRecordType.WaitingReturn:
          _waitingReturnRecords.addAll(lis);
          break;
      }
      return true;
    }
  }

  @override
  Future<ResCodeEnum> loadMoreNetAndPersist(int num, RBRecordType type) async{
    ReserveBorrowStatus? status;
    switch (type) {
      case RBRecordType.All:
        status = null;
        Res<List<ReserveBorrowBrief>> res = await _data.getRBRecordsNet(_user.userId, _allRecords.length, num, status: status);
        if (res.code == ResCodeEnum.Success) {
          for (var element in res.data!) {
            element.setUserId(_user.userId);
          }
          _allRecords.addAll(res.data!);
          _data.saveRBRecords(res.data!);
        }
        return res.code;
      case RBRecordType.WaitingPickup:
        status = ReserveBorrowStatus.WaitingPickUp;
        Res<List<ReserveBorrowBrief>> res = await _data.getRBRecordsNet(_user.userId, _waitingPickUpRecords.length, num, status: status);
        if (res.code == ResCodeEnum.Success) {
          for (var element in res.data!) {
            element.setUserId(_user.userId);
          }
          _waitingPickUpRecords.addAll(res.data!);
          _data.saveRBRecords(res.data!);
        }
        return res.code;
      case RBRecordType.WaitingReturn:
        status = ReserveBorrowStatus.WaitingReturn;
        Res<List<ReserveBorrowBrief>> res = await _data.getRBRecordsNet(_user.userId, _waitingReturnRecords.length, num, status: status);
        if (res.code == ResCodeEnum.Success) {
          for (var element in res.data!) {
            element.setUserId(_user.userId);
          }
          _waitingReturnRecords.addAll(res.data!);
          _data.saveRBRecords(res.data!);
        }
        return res.code;
    }
  }

  @override
  bool hasRefreshedNet(RBRecordType type) {
    switch (type) {
      case RBRecordType.All:
        return _hasRefreshedNetAll;
      case RBRecordType.WaitingPickup:
        return _hasRefreshedNetWaitingPickUp;
      case RBRecordType.WaitingReturn:
        return _hasRefreshedNetWaitingReturn;
    }
  }
}