import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/aggregation/user_home_data.dart';
import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/features/auth/export/auth_export_api.dart';
import 'package:elibapp/features/chart/export/chart_export_api.dart';
import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/home/data/home_page_data.dart';
import 'package:elibapp/features/viewing_history/export/viewing_history_export_api.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/book/book_brief_hr.dart';
import '../../../../entity/req/home_data_req.dart';
import '../../../../entity/struct/res.dart';
import '../home_page_repo.dart';

class HomePageRepoImpl implements HomePageRepo {
  late UserHomeData _data;

  final AuthExportApi _authExportApi = GetIt.I.get<AuthExportApi>();
  final HomePageData _homePageData = GetIt.I.get<HomePageData>();
  final ViewingHistoryExportApi _viewingHistoryExportApi = GetIt.I.get<ViewingHistoryExportApi>();
  final ChartExportApi _chartExportApi = GetIt.I.get<ChartExportApi>();

  int pageNum = 1;
  int pageSize = HomeUiStrategy.recoBooksReqNum;


  @override
  Future<List<BookBriefReco>> retriveNewRecoAndSave() async {
    Res<List<BookBriefReco>> res = await _homePageData.getBookBriefReco(pageNum, pageSize, _authExportApi.getCurrentUserId());
    ++pageNum;
    if (!res.isSuccess) return [];
    _data.recoBooks = res.data!;
    _homePageData.refreshBookBriefReco(_data.recoBooks);
    return _data.recoBooks;
  }

  @override
  List<BookBriefReco> getCurrentReco() {
    return _data.recoBooks;
  }

  @override
  List<BookBriefHR> getCurrentHR() {
    return _data.highlyRatedBooks;
  }

  @override
  List<BookBriefTB> getCurrentTB() {
    return _data.trendingBooks;
  }

  @override
  List<BookViewingHistory> getCurrentViewed() {
    return _data.viewingHistory;
  }

  @override
  void setAndPersistData(UserHomeData data) {
    _data = data;
    _homePageData.refreshBookBriefReco(data.recoBooks);
    _viewingHistoryExportApi.persistHistory(data.viewingHistory);
    _chartExportApi.persistHRChartData(data.highlyRatedBooks);
    _chartExportApi.persistTBChartData(data.trendingBooks);
  }

  @override
  void loadLocalDataSync() {
    List<BookBriefReco> recoBooks = _homePageData.getBookRecoFromLocalRange(0, HomeUiStrategy.recoBooksReqNum);
    List<BookViewingHistory> viewingHistory = _viewingHistoryExportApi.getViewingHistoryLocal(
      0,
      HomeUiStrategy.viewingHistoryGlanceNum,
      _authExportApi.getCurrentUserId(),
    );
    List<BookBriefTB> trendingBooks = _chartExportApi.getTBChartDataLocal(0, HomeUiStrategy.chartGlanceNum);
    List<BookBriefHR> highlyRatedBooks = _chartExportApi.getHRChartDataLocal(0, HomeUiStrategy.chartGlanceNum);

    _data = UserHomeData(
      hasNewAnnoun: false,
      recoBooks: recoBooks,
      viewingHistory: viewingHistory,
      trendingBooks: trendingBooks,
      highlyRatedBooks: highlyRatedBooks,
    );
  }

  @override
  Future<ResCodeEnum> retrieveAndSaveHomeData(HomeDataReq params) async {
    Res<UserHomeData> res = await _homePageData.getHomePageData(params, _authExportApi.getCurrentUserId());
    if (!res.isSuccess) return res.code;
    setAndPersistData(res.data!);
    return res.code;
  }
}