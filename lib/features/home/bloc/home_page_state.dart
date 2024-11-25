import 'package:elibapp/entity/aggregation/user_home_data.dart';
import 'package:equatable/equatable.dart';

sealed class HomePageState extends Equatable {
  // 仅仅是本地存有信息，可以刷新的状态
  static const HomePageState homePageRefreshedLocal = HomePageRefreshLocal();
  // 通过网络完成了一次刷新，但是将数据存往repository, 不在状态中携带数据
  static const HomePageState homePageRefresh = HomePageRefresh();
  // homePage的正在刷新状态
  static const HomePageState homePageLoading = HomePageLoading();
  static const HomePageState homePageError = HomePageError('error');
  const HomePageState();

  @override
  List<Object?> get props => [];
}


class HomePageRefreshLocal extends HomePageState {
  const HomePageRefreshLocal();
}

class HomePageRefresh extends HomePageState {
  const HomePageRefresh();
}

class HomePageInit extends HomePageState {
  final UserHomeData data;
  const HomePageInit(this.data);
}

class HomePageLoading extends HomePageState {
  const HomePageLoading();
}

class HomePageError extends HomePageState {
  final String msg;
  const HomePageError(this.msg);
  @override
  List<Object?> get props =>[msg];
}