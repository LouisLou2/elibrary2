import 'package:elibapp/features/author/data/author_data.dart';
import 'package:elibapp/features/author/data/impl/author_data_impl.dart';
import 'package:elibapp/features/author/export/author_export_api.dart';
import 'package:get_it/get_it.dart';

import 'export/impl/author_export_api_impl.dart';

class AuthorFeature {
  static void inject(){
    GetIt.I.registerLazySingleton<AuthorData>(() => AuthorDataImpl());
    GetIt.I.registerLazySingleton<AuthorExportApi>(() => AuthorExportApiImpl());
  }
}