import 'package:elibapp/entity/req/home_data_req.dart';

class HomeUiStrategy {
  static const int crowdRecoBookNum = 6;
  static const int recoBooksReqNum = 2 * crowdRecoBookNum + 1;
  static const int chartGlanceNum = 10;
  static const int viewingHistoryGlanceNum = 10;

  static const HomeDataReq defaultHomeDataReq = HomeDataReq(
    lastReadedAnnounId: 0,
    viewingHistoryPageSize: viewingHistoryGlanceNum,
    recoBookPageSize: recoBooksReqNum,
    chartPageSize: chartGlanceNum,
  );
}