import 'package:elibapp/features/shelf/data/impl/shelf_data_impl.dart';
import 'package:elibapp/features/shelf/data/shelf_data.dart';
import 'package:elibapp/features/shelf/repo/impl/shelf_repo_impl.dart';
import 'package:elibapp/features/shelf/repo/shelf_repo.dart';
import 'package:get_it/get_it.dart';

class ShelfFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<ShelfData>(()=>ShelfDataImpl());
    GetIt.I.registerLazySingleton<ShelfRepo>(() => ShelfRepoImpl());
  }
}