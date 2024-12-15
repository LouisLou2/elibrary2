import 'package:elibapp/features/categories/repo/cate_repo.dart';
import 'package:elibapp/features/categories/repo/impl/cate_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/cate_data.dart';
import 'data/impl/cate_data_impl.dart';
import 'export/cate_export_api.dart';
import 'export/impl/cate_export_api_impl.dart';

class CategoriesFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<CateRepo>(() => CateRepoImpl());
    GetIt.I.registerLazySingleton<CateData>(() => CateDataImpl());
    GetIt.I.registerLazySingleton<CateExportApi>(() => CateExportApiImpl());
  }
}