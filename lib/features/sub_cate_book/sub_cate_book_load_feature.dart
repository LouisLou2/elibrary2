import 'package:get_it/get_it.dart';

import 'data/impl/sub_cate_book_data_impl.dart';
import 'data/sub_cate_book_data.dart';

class SubCateBookLoadFeature{
  static void inject() {
    GetIt.I.registerLazySingleton<SubCateBookData>(() => SubCateBookDataImpl());
  }
}