import 'package:elibapp/features/announ/repo/announ_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'announ_event.dart';
import 'announ_state.dart';

class AnnounBloc extends Bloc<AnnounEvent, AnnounState> {

  final AnnounRepo _announRepo = GetIt.I<AnnounRepo>();
  AnnounBloc(): super(AnnounState.loadingNoData){
    _prepareFirstLoad();
    on<AnnounListReqRefresh>((event, emit) async {
      // 如果上一状态是retry，那么应该加入加载状态
      if (state is AnnounListRetry) {
        emit(AnnounState.loadingNoData);
        // 开始请求数据:刷新
        bool res = await _announRepo.refreshAnnounNet();
        if (res) {
          emit(const AnnounListRefreshSuccess(true));
        } else {
          emit(AnnounState.retry);
        }
      }else{
        // 说明此时屏幕上已经有数据了，所以直接刷新
        emit(AnnounState.loadingHasData);
        bool res = await _announRepo.refreshAnnounNet();
        if (res) {
          emit(AnnounState.refreshSuccess);
        } else {
          emit(AnnounState.refreshError);
        }
      }
    });

    on<AnnounListReqLoadMore> ((event, emit) async {
      assert(state is! AnnounListRetry);
      emit(AnnounState.loadingMore);
      bool res = await _announRepo.loadMoreNet();
      if (res) {
        emit(AnnounState.loadMoreSuccess);
      } else {
        emit(AnnounState.loadMoreError);
      }
    });
  }

  void _prepareFirstLoad() async {
    bool res = await _announRepo.refreshAnnounNet();
    // 开始请求数据:首次
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (res) {
          emit(const AnnounListRefreshSuccess(true));
        } else {
          emit(AnnounState.retry);
        }
      },
    );
  }
}