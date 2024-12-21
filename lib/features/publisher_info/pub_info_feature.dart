import 'package:elibapp/features/author_info/data/author_info_data.dart';
import 'package:get_it/get_it.dart';

import '../author_info/data/impl/author_info_data_impl.dart';
import 'data/impl/pub_info_data_impl.dart';
import 'data/pub_info_data.dart';

class PubInfoFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<PubInfoData>(() => PubInfoDataImpl());
  }
}