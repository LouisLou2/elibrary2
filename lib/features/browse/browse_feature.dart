import 'package:elibapp/features/browse/data/hit_category_data.dart';
import 'package:elibapp/features/browse/repo/hit_category_repo.dart';
import 'package:elibapp/features/browse/repo/impl/hit_category_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/hit_category_data_impl.dart';

class BrowseFeature {
  static void inject(){
    GetIt.I.registerLazySingleton<HitCategoryData>(() => HitCategoryDataImpl());
    GetIt.I.registerLazySingleton<HitCateRepo>(() => HitCateRepoImpl());
  }
}