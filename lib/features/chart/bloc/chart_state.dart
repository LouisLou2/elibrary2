import 'package:equatable/equatable.dart';

import '../const/chart_type.dart';

sealed class ChartPageState extends Equatable {
  const ChartPageState();

  @override
  List<Object?> get props => [];
}


class ChartPageRefreshLocal extends ChartPageState {
  final ChartType type;
  const ChartPageRefreshLocal(this.type);
  @override
  List<Object?> get props => [type];
}

class ChartPageRefresh extends ChartPageState {
  final ChartType type;
  const ChartPageRefresh(this.type);
  @override
  List<Object?> get props => [type];
}

class ChartPageRefreshLoading extends ChartPageState {
  final ChartType type;
  const ChartPageRefreshLoading(this.type);
  @override
  List<Object?> get props => [type];
}

class ChartPageRefreshError extends ChartPageState {
  final ChartType type;
  const ChartPageRefreshError(this.type);
  @override
  List<Object?> get props => [type];
}


class ChartPageLoadMoreOver extends ChartPageState {
  final ChartType type;
  final bool hasMoreData;
  const ChartPageLoadMoreOver(this.type, this.hasMoreData);
  @override
  List<Object?> get props => [type, hasMoreData];
}

class ChartPageLoadingMore extends ChartPageState {
  final ChartType type;
  const ChartPageLoadingMore(this.type);
  @override
  List<Object?> get props => [type];
}

class ChartPageLoadMoreError extends ChartPageState {
  final ChartType type;
  const ChartPageLoadMoreError(this.type);
  @override
  List<Object?> get props => [type];
}