import 'package:elibapp/common/res_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../repo/rb_detail_repo.dart';

enum RBDetailEvent { cancel, reqReloadNowNoData}

enum RBDetailState { loadingNowNoData, refreshedNet, retry}

class RBDetailBloc extends Bloc<RBDetailEvent, RBDetailState> {

  final RBDetailRepo _repo = GetIt.I<RBDetailRepo>();
  final int _reserveId;

  RBDetailBloc(this._reserveId): super(RBDetailState.loadingNowNoData){
    _prepareFirstPage();

    on<RBDetailEvent>((event, emit) async {
      switch (event) {
        case RBDetailEvent.cancel:
          throw UnimplementedError();
          break;
        case RBDetailEvent.reqReloadNowNoData:
          emit(RBDetailState.loadingNowNoData);
          ResCodeEnum res = await _repo.getRBDetail(_reserveId);
          if (res.isSuccess) {
            emit(RBDetailState.refreshedNet);
          }else{
            emit(RBDetailState.retry);
          }
          break;
      }
    });
  }

  void _prepareFirstPage() async{
    ResCodeEnum res = await _repo.getRBDetail(_reserveId);
    Future.delayed(const Duration(milliseconds: 100), (){
      if (res.isSuccess) {
        emit(RBDetailState.refreshedNet);
      }else {
        emit(RBDetailState.retry);
      }
    });
  }
}