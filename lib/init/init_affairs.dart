import 'package:elibapp/features/auth/bloc/auth_bloc.dart';
import 'package:elibapp/helper/nav/route_collector.dart';
import 'package:elibapp/init/injection_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base_manager/db_manager.dart';
import '../base_manager/path_manager.dart';
import '../features/auth/bloc/auth_state.dart';
import '../features/auth/datasource/auth_data.dart';

GetIt getIt = GetIt.I;

Future<void> initBeforeRunApp() async {
  // route_collector
  RouteCollector.init({});
  WidgetsFlutterBinding.ensureInitialized();
  // path_manager
  await PathManager.init();
  // db_manager
  await DBManager.init();
  // singleton
  InjectionManager.inject();
  // detectUserLocal
  detectUserLocal();
}

void setRouteCollection() {
  Map<String, WidgetBuilder> routes ={
    '/auth/login': (context) => const Text('login'),
  };
}

void detectUserLocal(){
  final userAuthParams = getIt<AuthDataSource>().userAuthParams;
  if (userAuthParams != null) {
    AuthBloc.initialState = UserLoadedLocal(userAuthParams);
  } else {
    AuthBloc.initialState = AuthState.userLoggedOut;
  }
}
