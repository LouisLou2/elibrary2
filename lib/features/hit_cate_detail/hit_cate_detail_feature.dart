import 'package:get_it/get_it.dart';

import 'data/hit_cate_detail_data.dart';
import 'data/impl/hit_cate_detail_data_impl.dart';

class HitCateDetailFeature {
  static void inject() {
    GetIt.I.registerLazySingleton<HitCateDetailData>(() => HitCateDetailDataImpl());
  }
}