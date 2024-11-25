import 'package:elibapp/features/viewing_history/export/viewing_history_export_api.dart';
import 'package:elibapp/features/viewing_history/repo/impl/viewing_history_repo_impl.dart';
import 'package:elibapp/features/viewing_history/repo/viewing_history_repo.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/viewing_history_data_impl.dart';
import 'data/viewing_history_data.dart';
import 'export/impl/viewing_history_export_api_impl.dart';

class ViewingHistoryFeature {
  static void inject() {
    GetIt.I.registerLazySingleton<ViewingHistoryData>(() => ViewingHistoryDataImpl());
    GetIt.I.registerLazySingleton<ViewingHistoryRepo>(() => ViewingHistoryRepoImpl());
    GetIt.I.registerLazySingleton<ViewingHistoryExportApi>(() => ViewingHistoryExportApiImpl());
  }
}