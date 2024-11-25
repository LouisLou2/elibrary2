import 'package:equatable/equatable.dart';

sealed class HomePageEvent extends Equatable{
  static const ReqRefreshEvent reqRefresh = ReqRefreshEvent();
  static const RefreshReqOverEvent refreshReqOverSuccess = RefreshReqOverEvent.success();
  static const RefreshReqOverEvent refreshReqOverFailedNoMsg = RefreshReqOverEvent.failedNoMsg();

  const HomePageEvent();
  @override
  List<Object> get props => [];
}

class ReqRefreshEvent extends HomePageEvent {
  const ReqRefreshEvent();
}

class RefreshReqOverEvent extends HomePageEvent {
  final bool success;
  final String? msg;
  const RefreshReqOverEvent._(this.success, this.msg);

  const RefreshReqOverEvent.success(): this._(true, '');
  const RefreshReqOverEvent.failedWithMsg(String msg): this._(false, msg);
  const RefreshReqOverEvent.failedNoMsg(): this._(false, null);

  @override
  List<Object> get props => [success];
}