import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/home/repo/home_page_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  final HomePageRepo _homePageRepo = GetIt.I<HomePageRepo>();

  HomePageBloc(HomePageState initial): super(initial) {

    assert(initial is HomePageInit || initial is HomePageRefreshLocal);
    initRepoUsingInitial(initial);

    /*----------------事件处理-------------------------*/
    on<ReqRefreshEvent>((event, emit) {
      print('HomePageBloc: ReqRefreshEvent');
      // 说明本地数据已经加载完毕，现在应该请求网络数据
      emit(HomePageState.homePageLoading);
      refresh();
    });

    on<RefreshReqOverEvent>((event, emit) {
      if (event.success) {
        emit(HomePageState.homePageRefresh);
      } else {
        emit(HomePageState.homePageError);
      }
    });
  }

  void initRepoUsingInitial(HomePageState sta) {
    if (sta is HomePageRefreshLocal) {
      // 说明是请求使用本地数据
      _homePageRepo.loadLocalDataSync();
    } else if (sta is HomePageInit) {
      // 说明网络数据已经加载完毕，现在应该保存数据
      _homePageRepo.setAndPersistData(sta.data);
    }
  }

  Future<void> refresh() async {
    print('HomePageBloc: refresh');
    ResCodeEnum resCode = await _homePageRepo.retrieveAndSaveHomeData(HomeUiStrategy.defaultHomeDataReq);
    if (resCode == ResCodeEnum.Success) {
      add(HomePageEvent.refreshReqOverSuccess);
    } else {
      add(HomePageEvent.refreshReqOverFailedNoMsg);// TODO: 这里默认不加msg了
    }
  }

}