import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/features/reserve_borrow_record/const/rb_record_ui_strategy.dart';
import 'package:elibapp/features/reserve_borrow_record/repo/rb_record_repo.dart';
import 'package:elibapp/helper/toast/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

enum RBEvent { reqRefreshNet, reqLoadMore}

enum RBState {
  loadingNoData,
  retry,

  refreshLocal,

  refreshedNet,
  refreshNetFailed,
  refreshingNet,

  loadedMore,
  loadedMoreFailed,
  loadingMore,
}

class RBRecordBloc extends Bloc<RBEvent, RBState> {

  final RBRecordRepo _repo = GetIt.I<RBRecordRepo>();
  final RBRecordType _type;

  RBRecordBloc(this._type) : super(RBState.loadingNoData){
    _prepareRefreshNet();

    on<RBEvent>((event, emit) async{
      switch (event) {
        case RBEvent.reqRefreshNet:
          if (state == RBState.retry) {
            emit(RBState.loadingNoData);
          }else {
            emit(RBState.refreshingNet);
          }
          ResCodeEnum res = await _repo.refreshNetAndPersist(RBRecordUiStrategy.recordPageSize, _type);
          if (res.isSuccess) {
            emit(RBState.refreshedNet);
          } else {
            emit(state == RBState.loadingNoData ? RBState.retry : RBState.refreshNetFailed);
          }
          break;
        case RBEvent.reqLoadMore:
          assert(state != RBState.retry && state != RBState.loadingNoData);
          emit(RBState.loadingMore);
          ResCodeEnum res = await _repo.loadMoreNetAndPersist(RBRecordUiStrategy.recordPageSize, _type);
          if (res.isSuccess) {
            emit(RBState.loadedMore);
          } else {
            emit(RBState.loadedMoreFailed);
          }
          break;
      }
    });
  }

  void _prepareRefreshNet() async {
    ResCodeEnum res = await _repo.refreshNetAndPersist(RBRecordUiStrategy.recordPageSize, _type);
    RBState nextState;
    if (res.isSuccess) {
      nextState = RBState.refreshedNet;
    } else {
      // 寻求本地数据
      bool localRes = _repo.initRecordsLocal(RBRecordUiStrategy.recordPageSize, _type);
      if (!localRes) {
        nextState = RBState.retry;
      } else {
        nextState = RBState.refreshLocal;
      }
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      emit(nextState);
      if (!res.isSuccess){
        ToastHelper.showToaster(code: res);
      }
    });
  }
}