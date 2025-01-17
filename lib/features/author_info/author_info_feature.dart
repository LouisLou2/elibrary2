import 'package:elibapp/features/author_info/data/author_info_data.dart';
import 'package:get_it/get_it.dart';

import '../author_info/data/impl/author_info_data_impl.dart';

class AuthorInfoFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<AuthorInfoData>(() => AuthorInfoDataImpl());
  }
}