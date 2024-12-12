import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/features/shelf/const/shelf_ui_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../repo/shelf_repo.dart';

enum ShelfLoadEvent {
  reqNetRefresh,
  reqNetLoadMore
}
enum ShelfLoadState {
  refreshingNetNowNoData,
  retry,

  refreshLocal,
  refreshingNet,
  refreshNetFailure,
  refreshNetSuccess,

  /*----load mre的前提就是屏幕上肯定是有数据的----*/
  loadedMoreNet,
  loadedMoreFailure,
  loadingMoreNet
}

class ShelfLoadBloc extends Bloc<ShelfLoadEvent, ShelfLoadState> {

  final ShelfRepo _repo = GetIt.I<ShelfRepo>();

  ShelfLoadBloc() : super(resolveInitialState()){
    _prepareFirstLoad();
    on<ShelfLoadEvent>((event, emit) async{
      switch (event) {
        case ShelfLoadEvent.reqNetRefresh:
          emit(state == ShelfLoadState.retry? ShelfLoadState.refreshingNetNowNoData : ShelfLoadState.refreshingNet);
          ResCodeEnum res = await _repo.refreshUsingNetAndPersist(ShelfUiStrategy.pageSize);
          if (res.isSuccess) {
            emit(ShelfLoadState.refreshNetSuccess);
          } else {
            emit(state == ShelfLoadState.refreshingNetNowNoData ? ShelfLoadState.retry : ShelfLoadState.refreshNetFailure);
          }
          break;
        case ShelfLoadEvent.reqNetLoadMore:
          emit(ShelfLoadState.loadingMoreNet);
          ResCodeEnum res = ResCodeEnum.Success;
          if (!_repo.hasRefreshedNet()){
            res = await _repo.refreshUsingNetAndPersist(ShelfUiStrategy.pageSize, needPageNum: 2);
          }else{
            res = await _repo.loadMoreUsingNetAndPersist(ShelfUiStrategy.pageSize);
          }
          if (res.isSuccess) {
            emit(ShelfLoadState.loadedMoreNet);
          } else {
            emit(ShelfLoadState.loadedMoreFailure);
          }
          break;
        default:
          throw Exception('event not found');
      }
    });
  }

  static ShelfLoadState resolveInitialState(){
    final ShelfRepo repo = GetIt.I<ShelfRepo>();
    bool has = repo.initListWithLocal(ShelfUiStrategy.pageSize);
    if (has){
      return ShelfLoadState.refreshLocal;
    } else {
      return ShelfLoadState.refreshingNetNowNoData;
    }
  }

  void _prepareFirstLoad() async {
    ResCodeEnum res = await _repo.refreshUsingNetAndPersist(ShelfUiStrategy.pageSize);
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (res.isSuccess) {
          emit(ShelfLoadState.refreshNetSuccess);
        } else {
          emit(state == ShelfLoadState.refreshingNetNowNoData? ShelfLoadState.retry : ShelfLoadState.refreshNetFailure);
        }
      },
    );
  }
}