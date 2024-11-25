import 'package:elibapp/features/auth/export/auth_export_api.dart';
import 'package:elibapp/features/chart/chart_feature.dart';
import 'package:elibapp/features/home/home_feature.dart';
import 'package:elibapp/features/viewing_history/viewing_history_feature.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/auth_feature.dart';
import '../features/sign_in/sign_in_feature.dart';
import '../service/req/req_proxy.dart';
import '../service/req/requester.dart';

class InjectionManager{
  static void inject(){
    AuthFeature.inject();
    _injectRequester();
    SignInFeature.inject();
    ViewingHistoryFeature.inject();
    ChartFeature.inject();
    HomeFeature.inject();
  }

  // 此函数必须在AuthFeature.inject();之后调用
  static void _injectRequester(){
    AuthExportApi authExportApi = GetIt.I<AuthExportApi>();
    GetIt.I.registerLazySingleton<Requester>(() => ReqProxy(
      authExportApi.getCurrentUserAt,
      authExportApi.retrieveSetAtAndReactToResult,
    ));
  }
}