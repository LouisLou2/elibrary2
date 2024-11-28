import '../const/chart_type.dart';

sealed class ChartPageEvent{
  const ChartPageEvent();
}

class ReqRefreshLocal extends ChartPageEvent {
  final ChartType type;
  const ReqRefreshLocal(this.type);
}

class ReqRefreshNet extends ChartPageEvent {
  final ChartType type;
  const ReqRefreshNet(this.type);
}

class ReqLoadMoreNet extends ChartPageEvent {
  final ChartType type;
  const ReqLoadMoreNet(this.type);
}