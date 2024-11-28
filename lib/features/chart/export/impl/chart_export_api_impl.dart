import 'package:elibapp/features/chart/data/chart_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/book/book_brief_hr.dart';
import '../../../../entity/book/book_brief_tb.dart';
import '../../chart_feature.dart';
import '../chart_export_api.dart';

class ChartExportApiImpl extends ChartExportApi {

  final ChartData _tbChartData = GetIt.I<ChartData>(instanceName: ChartFeature.tbChartDataIName);
  final ChartData _hrChartData = GetIt.I<ChartData>(instanceName: ChartFeature.hrChartDataIName);

  @override
  List<BookBriefHR> getHRChartDataLocal(int pageNum, int pageSize) {
    return _hrChartData.getChartDataLocal(pageNum, pageSize) as List<BookBriefHR>;
  }

  @override
  List<BookBriefTB> getTBChartDataLocal(int pageNum, int pageSize) {
    return _tbChartData.getChartDataLocal(pageNum, pageSize) as List<BookBriefTB>;
  }

  @override
  void persistHRChartData(List<BookBriefHR> chartEntityList) {
    _hrChartData.persistChartData(chartEntityList);
  }

  @override
  void persistTBChartData(List<BookBriefTB> chartEntityList) {
    _tbChartData.persistChartData(chartEntityList);
  }

}