import 'package:elibapp/features/sign_in/data/user_verify_data.dart';
import 'package:elibapp/features/sign_in/repo/impl/sign_in_repo_impl.dart';
import 'package:elibapp/features/sign_in/repo/sign_in_repo.dart';
import 'package:get_it/get_it.dart';

import 'data/impl/user_verify_data_impl.dart';

class SignInFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<UserVerifyData>(() => UserVerifyDataImpl());
    GetIt.I.registerLazySingleton<SignInRepo>(() => SignInRepoImpl());
  }
}