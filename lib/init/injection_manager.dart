import 'package:elibapp/features/auth/repo/user_state_repo.dart';
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
  }

  // 此函数必须在AuthFeature.inject();之后调用
  static void _injectRequester(){
    UserStateRepo repo = GetIt.I.get<UserStateRepo>();
    GetIt.I.registerLazySingleton<Requester>(() => ReqProxy(
      repo.getUserAt,
      repo.retriveAndSetAt
    ));
  }
}