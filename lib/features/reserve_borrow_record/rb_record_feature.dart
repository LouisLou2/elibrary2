import 'package:elibapp/features/reserve_borrow_record/repo/impl/rb_record_repo_impl.dart';
import 'package:elibapp/features/reserve_borrow_record/repo/rb_record_repo.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/rb_record_data_impl.dart';
import 'data/rb_record_data.dart';

class RBRecordFeature {
  static void inject() {
    GetIt.I.registerLazySingleton<RBRecordData>(() => RBRecordDataImpl());
    GetIt.I.registerLazySingleton<RBRecordRepo>(() => RBRecordRepoImpl());
  }
}