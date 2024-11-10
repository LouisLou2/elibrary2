import 'package:elibapp/config/business_basic_rule.dart';
import 'package:elibapp/entity/res.dart';
import 'package:elibapp/entity/user_auth_params.dart';
import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:elibapp/features/sign_in/data/user_verify_data.dart';
import 'package:elibapp/global_state/global_user_state.dart';
import 'package:get_it/get_it.dart';

import '../sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final UserVerifyData _ver = GetIt.I<UserVerifyData>();
  final AuthDataSource _auth = GetIt.I<AuthDataSource>();

  @override
  String nowEmail = '';

  int _secLeft=0;

  @override
  void noteSendEmailCodeTime(String email) {
    _secLeft = DateTime.now().millisecondsSinceEpoch~/1000;
    nowEmail=email;
  }

  @override
  int get secLeft{
    int now=DateTime.now().millisecondsSinceEpoch~/1000;
    return BusinessBasicRule.sendEmailCodeIntervalInSec-(now-_secLeft);
  }

  @override
  Future<Res<void>> resendEmailCode() {
    return _ver.sendEmailCode(nowEmail);
  }

  
  @override
  Future<Res<void>> sendEmailCode(String email) async{
    return _ver.sendEmailCode(email);
  }

  @override
  Future<Res<void>> verifyEmailCodeAndSaveUser(String email, String code) async{
    Res<UserAuthParams> res = await _ver.verifyEmailCode(email, code);
    if (!res.isSuccess) return res as Res<void>;
    UserAuthParams userAuthParams = res.data!;
    GlobalUserState.user=userAuthParams;
    _auth.saveUserAuthParams(userAuthParams);
    return Res.success();
  }

  @override
  Future<Res<void>> verifyEmailPwdAndSaveUser(String email, String pwd) async{
    Res<UserAuthParams> res = await _ver.verifyEmailPwd(email, pwd);
    if (!res.isSuccess) return res as Res<void>;
    UserAuthParams userAuthParams = res.data!;
    GlobalUserState.user=userAuthParams;
    _auth.saveUserAuthParams(userAuthParams);
    return Res.success();
  }
  
}