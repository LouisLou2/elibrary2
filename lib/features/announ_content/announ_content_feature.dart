import 'package:elibapp/features/announ_content/data/announ_content_data.dart';
import 'package:elibapp/features/announ_content/repo/announ_content_repo.dart';
import 'package:elibapp/features/announ_content/repo/impl/announ_content_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/announ_content_data_impl.dart';

class AnnounContentFeature {
  static void inject(){
    GetIt.I.registerLazySingleton<AnnounContentData>(() => AnnounContentDataImpl());
    GetIt.I.registerLazySingleton<AnnounContentRepo>(() => AnnounContentRepoImpl());
  }
}