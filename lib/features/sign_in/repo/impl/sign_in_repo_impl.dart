import 'package:elibapp/config/business_basic_rule.dart';
import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/entity/user/authed_user_with_data.dart';
import 'package:elibapp/features/global_aggreement/const/home_ui_strategy.dart';
import 'package:elibapp/features/sign_in/data/user_verify_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/user/authed_user_with_data1.dart';
import '../sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final UserVerifyData _ver = GetIt.I<UserVerifyData>();
  //final AuthDataSource _auth = GetIt.I<AuthDataSource>();

  @override
  String nowEmail = '';

  int _secLeft=0;

  @override
  void noteSendEmailCodeTime(String email) {
    _secLeft = DateTime.now().millisecondsSinceEpoch~/1000;
    nowEmail = email;
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
  Future<Res<AuthedUserWithData1>> verifyEmailCode(String email, String code) async{
    Res<AuthedUserWithData> res = await _ver.verifyEmailCode(email, code, HomeUiStrategy.defaultHomeDataReq);
    if (!res.isSuccess) return res.to<AuthedUserWithData1>();
    int userId = res.data!.user.user.userId;
    return Res.successWithData(AuthedUserWithData1.from(res.data!,userId));
  }

  @override
  Future<Res<AuthedUserWithData1>> verifyEmailPwd(String email, String pwd) async{
    Res<AuthedUserWithData> res = await _ver.verifyEmailPwd(email, pwd, HomeUiStrategy.defaultHomeDataReq);
    if (!res.isSuccess) return res.to<AuthedUserWithData1>();
    int userId = res.data!.user.user.userId;
    return Res.successWithData(AuthedUserWithData1.from(res.data!,userId));
  }
  
}