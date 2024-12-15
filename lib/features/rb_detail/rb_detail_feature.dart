import 'package:elibapp/features/rb_detail/repo/impl/rb_detail_repo_impl.dart';
import 'package:elibapp/features/rb_detail/repo/rb_detail_repo.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/rb_detail_data_impl.dart';
import 'data/rb_detail_data.dart';

class RBDetailFeature {
  static void inject() {
    GetIt.I.registerLazySingleton<RBDetailData>(() => RBDetailDataImpl());
    GetIt.I.registerLazySingleton<RBDetailRepo>(() => RBDetailRepoImpl());
  }
}