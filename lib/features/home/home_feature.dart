import 'package:elibapp/features/home/repo/home_page_repo.dart';
import 'package:elibapp/features/home/repo/impl/home_page_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/home_page_data.dart';
import 'data/impl/home_page_data_impl.dart';

class HomeFeature {
  static void inject() {
    GetIt.I.registerLazySingleton<HomePageData>(() => HomePageDataImpl());
    GetIt.I.registerLazySingleton<HomePageRepo>(() => HomePageRepoImpl());
  }
}