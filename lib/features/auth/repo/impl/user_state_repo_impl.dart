import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/user/user_auth_params.dart';
import '../user_state_repo.dart';

class UserStateRepoImpl extends UserStateRepo{

  final AuthDataSource _auth = GetIt.I<AuthDataSource>();
  UserAuthParams? userAuthParams;

  @override
  bool get isLogin => userAuthParams != null;

  @override
  int get userId {
    assert (userAuthParams != null);
    return userAuthParams!.userId;
  }

  @override
  void setAndPersistUser(UserAuthParams params) {
    userAuthParams = params;
    _auth.saveUserAuthParams(params); // async
  }

  @override
  void setUser(UserAuthParams params) {
    userAuthParams = params;
  }

  @override
  String getUserAt() {
    assert (userAuthParams != null);
    return userAuthParams!.at;
  }

  @override
  Future<bool> retrieveAndSetAt() async {
    assert (userAuthParams != null);
    Res<String> res = await _auth.getAccessToken(userAuthParams!.at);
    if (res.isSuccess){
      userAuthParams!.at = res.data!;
      _auth.saveUserAuthParams(userAuthParams!); // async
      return true;
    }
    return false;
  }

  @override
  void clearUser() {
    _auth.clearPersistedUser(userAuthParams!.userId); // async
    userAuthParams = null;
  }
}