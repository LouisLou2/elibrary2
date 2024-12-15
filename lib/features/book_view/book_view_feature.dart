import 'package:elibapp/features/book_view/repo/book_view_repo.dart';
import 'package:elibapp/features/book_view/repo/impl/book_view_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'data/book_view_data.dart';
import 'data/impl/book_view_data_impl.dart';

class BookViewFeature {
  static void inject(){
    GetIt.I.registerLazySingleton<BookViewData>(() => BookViewDataImpl());
    // GetIt.I.registerLazySingleton<BookViewRepo>(() => BookViewRepoImpl());
  }
}