import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:get_it/get_it.dart';

import 'datasource/auth_data.dart';
import 'datasource/auth_data_impl.dart';

class AuthFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<AuthDataSource>(() => AuthDataImpl());
    GetIt.I.registerLazySingleton<UserStateRepo>(() => UserStateRepo());
  }
}