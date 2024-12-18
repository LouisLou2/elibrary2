import 'package:elibapp/features/search/data/impl/search_hist_data_impl.dart';
import 'package:elibapp/features/search/data/search_hist_data.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/search_data_impl.dart';
import 'data/search_data.dart';

class SearchFeature{
  static void inject() {
    GetIt.I.registerLazySingleton<SearchData>(() => SearchDataImpl());
    GetIt.I.registerFactory<SearchHistData>(() => SearchHistDataImpl());
  }
}