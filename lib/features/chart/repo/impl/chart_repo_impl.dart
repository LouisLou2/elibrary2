import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:elibapp/entity/struct/load_signal.dart';
import 'package:elibapp/features/chart/const/chart_type.dart';
import 'package:elibapp/features/chart/const/chart_ui_strategy.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/book/book_brief_hr.dart';
import '../../../../entity/struct/res.dart';
import '../../chart_feature.dart';
import '../../data/chart_data.dart';
import '../chart_repo.dart';

class ChartRepoImpl extends ChartRepo {

  final ChartData _tbChartData = GetIt.I<ChartData>(instanceName: ChartFeature.tbChartDataIName);
  final ChartData _hrChartData = GetIt.I<ChartData>(instanceName: ChartFeature.hrChartDataIName);

  // bool _tbHasLoadedWithNet = false;
  List<BookBriefTB> _tbChartBooks = [];
  // bool _hrHasLoadedWithNet = false;
  List<BookBriefHR> _hrChartBooks = [];

  // 这这pageNum表示下一次需要开始加载的页数（仅仅net）
  int _tbChartPageNum = 0;
  int _hrChartPageNum = 0;

  @override
  void initRepoWithLocalData(ChartType type) {
    switch (type) {
      case ChartType.Trending:
        if (_tbChartBooks.isEmpty) {
          _tbChartBooks = _tbChartData.getChartDataLocal(0, ChartUiStrategy.chartPageSize) as List<BookBriefTB>;
        }
        break;
      case ChartType.HighlyRated:
        if (_hrChartBooks.isEmpty) {
          _hrChartBooks = _hrChartData.getChartDataLocal(0, ChartUiStrategy.chartPageSize) as List<BookBriefHR>;
        }
        break;
    }
  }

  @override
  Future<ResCodeEnum> refreshListWithNet(ChartType type) async{
    switch (type) {
      case ChartType.Trending:
        Res<List<BookBriefTB>> res = await _tbChartData.getChartDataRemote(0, ChartUiStrategy.chartPageSize) as Res<List<BookBriefTB>>;
        if (!res.isSuccess) return res.code;
        _tbChartBooks = res.data!;
        _tbChartData.persistChartData(_tbChartBooks);
        // _tbHasLoadedWithNet = true;
        _tbChartPageNum = 1;
        return ResCodeEnum.Success;

      case ChartType.HighlyRated:
        Res<List<BookBriefHR>> res = await _hrChartData.getChartDataRemote(0, ChartUiStrategy.chartPageSize) as Res<List<BookBriefHR>>;
        if (!res.isSuccess) return res.code;
        _hrChartBooks = res.data!;
        _hrChartData.persistChartData(_hrChartBooks);
        // _hrHasLoadedWithNet = true;
        _hrChartPageNum = 1;
        return ResCodeEnum.Success;
    }
  }

  @override
  Future<LoadSignal> loadMoreListWithNet(ChartType type) async{
    switch (type) {
      case ChartType.Trending:
        if (_tbChartPageNum <= 0) return LoadSignal.failed(ResCodeEnum.ServiceRefused);
        Res<List<BookBriefAbs>> res = await _tbChartData.getChartDataRemote(_tbChartPageNum, ChartUiStrategy.chartPageSize);
        if (!res.isSuccess) return LoadSignal.failed(res.code);
        List<BookBriefTB> lis = res.data as List<BookBriefTB>;
        if (lis.isEmpty) return LoadSignal.success(false);
        _tbChartBooks.addAll(lis);
        ++_tbChartPageNum;
        _tbChartData.persistChartData(lis);
        return LoadSignal.success(true);

      case ChartType.HighlyRated:
        if (_hrChartPageNum <= 0) return LoadSignal.failed(ResCodeEnum.ServiceRefused);
        Res<List<BookBriefAbs>> res = await _hrChartData.getChartDataRemote(_hrChartPageNum, ChartUiStrategy.chartPageSize);
        if (!res.isSuccess) return LoadSignal.failed(res.code);
        List<BookBriefHR> lis = res.data as List<BookBriefHR>;
        if (lis.isEmpty) return LoadSignal.success(false);
        _hrChartBooks.addAll(lis);
        ++_hrChartPageNum;
        _hrChartData.persistChartData(lis);
        return LoadSignal.success(true);
    }
  }

  @override
  bool isListLoadedWithNet(ChartType type) {
    switch (type) {
      case ChartType.Trending:
        return _tbChartPageNum > 0;
      case ChartType.HighlyRated:
        return _hrChartPageNum > 0;
    }
  }

  @override
  int lengthInMemCount(ChartType type) {
    switch (type) {
      case ChartType.Trending:
        return _tbChartBooks.length;
      case ChartType.HighlyRated:
        return _hrChartBooks.length;
    }
  }

  @override
  BookBriefAbs? getBookByIndexMem(ChartType type, int index) {
    switch (type) {
      case ChartType.Trending:
        if (index < 0 || index >= _tbChartBooks.length) return null;
        return _tbChartBooks[index];
      case ChartType.HighlyRated:
        if (index < 0 || index >= _hrChartBooks.length) return null;
        return _hrChartBooks[index];
    }
  }

}