import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/struct/load_signal.dart';
import 'package:elibapp/features/chart/repo/chart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../const/chart_type.dart';
import 'chart_event.dart';
import 'chart_state.dart';

class ChartBloc extends Bloc<ChartPageEvent, ChartPageState> {
  final ChartRepo _chartRepo = GetIt.I<ChartRepo>();

  ChartBloc(ChartPageState initial) : super(initial){
    assert(initial is ChartPageRefreshLocal);
    initRepoWithLocalData((initial as ChartPageRefreshLocal).type);

    on<ReqRefreshLocal>((event, emit) {
      print('@@@@@@@@@@@@@@@bloc get ReqRefreshLocal: ${event.type}');
      // 说明要从本地刷新数据，但是如果repo里面已经有了数据，就不用再刷新了
      // 这个情况就是，用户切换到了一个之前没有看过的chart type
      initRepoWithLocalData(event.type);
      emit(ChartPageRefreshLocal(event.type));
    });

    on<ReqRefreshNet>((event, emit) async {
      print('@@@@@@@@@@@@@bloc get ReqRefreshNet: ${event.type}');
      // 说明要从网络刷新数据
      // 先发出loading状态
      emit(ChartPageRefreshLoading(event.type));
      // 开始从网络获取数据
      bool canRefresh = await refreshNet(event.type);
      if (canRefresh) {
        emit(ChartPageRefresh(event.type));
      } else {
        emit(ChartPageRefreshError(event.type));
      }
    });

    on<ReqLoadMoreNet>((event, emit) async {
      print('@@@@@@@@@@@@@@@@@bloc get ReqLoadMoreNet: ${event.type}');
      // 说明要从网络加载更多数据
      // 先发出loading状态
      emit(ChartPageLoadingMore(event.type));
      // 开始从网络获取数据
      LoadSignal signal = await loadMoreNet(event.type);
      if (signal.isReqSuccess) {
        if (signal.hasMoreData) {
          emit(ChartPageLoadMoreOver(event.type, true));
        } else {
          emit(ChartPageLoadMoreOver(event.type, false));
        }
      } else {
        emit(ChartPageLoadMoreError(event.type));
      }
    });
  }

  void initRepoWithLocalData(ChartType type) {
    _chartRepo.initRepoWithLocalData(type);
  }

  Future<bool> refreshNet(ChartType type) async {
    return (await _chartRepo.refreshListWithNet(type)).isSuccess;
  }

  Future<LoadSignal> loadMoreNet(ChartType type) async {
    LoadSignal signal = await _chartRepo.loadMoreListWithNet(type);
    return signal;
  }

}