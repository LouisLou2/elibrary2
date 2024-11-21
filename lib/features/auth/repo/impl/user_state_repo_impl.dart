
import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/res.dart';
import 'package:elibapp/entity/user_auth_params.dart';
import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:get_it/get_it.dart';

import '../user_state_repo.dart';

class UserStateRepoImpl extends UserStateRepo{
  AuthDataSource auth = GetIt.I<AuthDataSource>();
  UserAuthParams? userAuthParams;

  @override
  bool get isLogin => userAuthParams != null;

  @override
  set user(UserAuthParams userAuthParams) {
    this.userAuthParams = userAuthParams;
  }

  @override
  String getUserAt() {
    assert (userAuthParams != null);
    return userAuthParams!.at;
  }

  // @override
  // void setUserAt(String at) {
  //   assert (userAuthParams != null);
  //   userAuthParams!.at = at;
  // }

  @override
  Future<ResCodeEnum> retriveAndSetAt() async {
    assert (userAuthParams != null);
    Res<String> res = await auth.getAccessToken();
    if (res.isSuccess){
      userAuthParams!.at = res.data!;
      auth.saveUserAuthParams(userAuthParams!); // async
    }
    return res.code;
  }

}