import 'package:elibapp/features/categories/repo/cate_repo.dart';
import 'package:elibapp/features/categories/repo/impl/cate_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/cate_data.dart';
import 'data/impl/cate_data_impl.dart';

class CategoriesFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<CateRepo>(() => CateRepoImpl());
    GetIt.I.registerLazySingleton<CateData>(() => CateDataImpl());
  }
}