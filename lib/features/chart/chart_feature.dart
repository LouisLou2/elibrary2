import 'package:elibapp/features/chart/data/impl/tb_chart_data_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/chart_data.dart';
import 'data/impl/hr_chart_data_impl.dart';
import 'export/chart_export_api.dart';
import 'export/impl/chart_export_api_impl.dart';

enum ChartType {
  TB,
  HR,
}

class ChartFeature{
  static const String tbChartDataIName = 'TBChartData';
  static const String hrChartDataIName = 'HRChartData';

  static void inject() {
    GetIt.I.registerLazySingleton<ChartData>(() => TBChartDataImpl(),instanceName: tbChartDataIName);
    GetIt.I.registerLazySingleton<ChartData>(() => HRChartDataImpl(),instanceName: hrChartDataIName);
    GetIt.I.registerLazySingleton<ChartExportApi>(() => ChartExportApiImpl());
  }

}