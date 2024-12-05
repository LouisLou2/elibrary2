import 'package:elibapp/features/announ/data/announ_data.dart';
import 'package:elibapp/features/announ/repo/announ_repo.dart';
import 'package:elibapp/features/announ/repo/impl/announ_repo.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/announ_data_impl.dart';

class AnnounFeature {
  static void inject(){
    GetIt.I.registerLazySingleton<AnnounData>(() => AnnounDataImpl());
    GetIt.I.registerLazySingleton<AnnounRepo>(() => AnnounRepoImpl());
  }
}