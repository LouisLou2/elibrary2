import 'package:equatable/equatable.dart';

sealed class AnnounEvent extends Equatable {
  static const AnnounEvent reqRefresh = AnnounListReqRefresh();
  static const AnnounEvent reqLoadMore = AnnounListReqLoadMore();


  const AnnounEvent();

  @override
  List<Object> get props => [];
}

class AnnounListReqRefresh extends AnnounEvent {
  const AnnounListReqRefresh();
}
class AnnounListReqLoadMore extends AnnounEvent {
  const AnnounListReqLoadMore();
}