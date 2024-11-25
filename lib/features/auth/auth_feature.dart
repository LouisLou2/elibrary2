import 'package:elibapp/features/auth/bloc/auth_bloc.dart';
import 'package:elibapp/features/auth/export/auth_export_api.dart';
import 'package:elibapp/features/auth/export/impl/auth_export_api_impl.dart';
import 'package:elibapp/features/auth/repo/impl/user_state_repo_impl.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:get_it/get_it.dart';

import 'datasource/auth_data.dart';
import 'datasource/auth_data_impl.dart';

class AuthFeature{
  static void inject(){
    GetIt.I.registerLazySingleton<AuthDataSource>(() => AuthDataImpl());
    GetIt.I.registerLazySingleton<UserStateRepo>(() => UserStateRepoImpl());
    GetIt.I.registerLazySingleton<AuthBloc>(() => AuthBloc());
    GetIt.I.registerLazySingleton<AuthExportApi>(() => AuthExportApiImpl());
  }
}