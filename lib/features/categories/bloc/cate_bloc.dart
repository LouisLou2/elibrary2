import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/features/categories/repo/cate_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

enum CateEvent { reqRefreshNowNoData, reqRefreshNet}

enum CateState { loadingNowNoData, retry, refreshLocal, refreshNet}

class CateBloc extends Bloc<CateEvent, CateState> {

  final CateRepo _cateRepo = GetIt.I<CateRepo>();

  CateBloc():super(_resolveInitState()){
    _prepareFirstRefreshNet();
    on<CateEvent>((event, emit) async{
      if (event == CateEvent.reqRefreshNowNoData) {
        emit(CateState.loadingNowNoData); // 进入页面loading状态
        ResCodeEnum res = await _cateRepo.getFromNetAndPersist();
        if (res.isSuccess) {
          emit(CateState.refreshNet);
        }else {
          emit(CateState.retry);
        }
      }else if (event == CateEvent.reqRefreshNet) {
        ResCodeEnum res = await _cateRepo.getFromNetAndPersist();
        if (res.isSuccess) {
          emit(CateState.refreshNet);
        }
        // 失败就不做任何事
      }
    });
  }

  void _prepareFirstRefreshNet(){
    Future.delayed(const Duration(milliseconds: 100), () async{
      ResCodeEnum res = await _cateRepo.getFromNetAndPersist();
      if (res.isSuccess) {
        emit(CateState.refreshNet);
      }else {
        if (state == CateState.loadingNowNoData) {
          emit(CateState.retry);
        }
      }
    });
  }

  static CateState _resolveInitState() {
    CateRepo cateRepo = GetIt.I<CateRepo>();
    bool res = cateRepo.initFromLocal();
    if (res) {
      return CateState.refreshLocal;
    }else {
      return CateState.loadingNowNoData;
    }
  }
}