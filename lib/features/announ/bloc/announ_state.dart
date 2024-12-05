import 'package:equatable/equatable.dart';

sealed class AnnounState extends Equatable {
  static const AnnounListLoadingNoData loadingNoData = AnnounListLoadingNoData();
  static const AnnounState loadingHasData = AnnounListLoadingHasData();
  static const AnnounState retry = AnnounListRetry();

  static const AnnounState refreshSuccess = AnnounListRefreshSuccess(false);
  static const AnnounState refreshError = AnnounListRefreshError();

  static const AnnounState loadMoreError = AnnounListLoadMoreError();
  static const AnnounState loadingMore = AnnounListLoadingMore();
  static const AnnounState loadMoreSuccess = AnnounListLoadMoreSuccess();

  const AnnounState();

  @override
  List<Object> get props => [];
}

/*-------about loading-----------------------------------------*/

// 整个屏幕只有一个加载progress
class AnnounListLoadingNoData extends AnnounState {
  const AnnounListLoadingNoData();
}

// 屏幕上有数据，但是正在加载
class AnnounListLoadingHasData extends AnnounState {
  const AnnounListLoadingHasData();
}

// 重试
class AnnounListRetry extends AnnounState {
  const AnnounListRetry();
}

/*-------about refresh-----------------------------------------*/

class AnnounListRefreshSuccess extends AnnounState {
  final bool isFirst;
  const AnnounListRefreshSuccess(this.isFirst);
}
// 已有数据，但是刷新失败
class AnnounListRefreshError extends AnnounState {
  const AnnounListRefreshError();
}

/*-------about load more-----------------------------------------*/
// 有数据，但是加载更多失败
class AnnounListLoadMoreError extends AnnounState {
  const AnnounListLoadMoreError();
}

// 有数据，正在加载更多
class AnnounListLoadingMore extends AnnounState {
  const AnnounListLoadingMore();
}

// 有数据，加载更多成功
class AnnounListLoadMoreSuccess extends AnnounState {
  const AnnounListLoadMoreSuccess();
}