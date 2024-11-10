import 'package:elibapp/common/contact_type.dart';
import 'package:elibapp/entity/authed_user.dart';
import 'package:elibapp/entity/res.dart';

import 'package:elibapp/entity/user_auth_params.dart';
import 'package:elibapp/global_state/device_info.dart';
import 'package:elibapp/helper/network/net_path_collector.dart';

import '../../../../common/res_enum.dart';
import '../../../../entity/resp.dart';
import '../../../../helper/network/request_helper.dart';
import '../user_verify_data.dart';

class UserVerifyDataImpl implements UserVerifyData {

  @override
  Future<Res<void>> sendEmailCode(String email) async {
    Res<Resp?> res = await RequestHelper.standardRequestNoAuth(
      NetworkPathCollector.auth.sendCode,
      HttpMethod.POST,
      {
        'contact':email,
        'way': ContactType.Email.value,
      }
    );
    if (!res.isSuccess) return res.to<void>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      return Res.success();
    }
    return Res.failedMayWithMsg(resp.code, resp.message);
  }

  @override
  Future<Res<UserAuthParams>> verifyEmailCode(String email, String code) async{
    Res<Resp?> res = await RequestHelper.standardRequestNoAuth(
      NetworkPathCollector.auth.loginPwd,
      HttpMethod.POST,
      {
        'email':email,
        'code':code,
        'device_type':DeviceInfo.deviceType,
      }
    );
    if (!res.isSuccess) return res.to<UserAuthParams>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      AuthedUser authedUser = AuthedUser.fromJson(resp.data);
      return Res.successWithData(UserAuthParams.fromAuthedUser(authedUser));
    }
    return Res.failedMayWithMsg(resp.code, resp.message);
  }

  @override
  Future<Res<UserAuthParams>> verifyEmailPwd(String email, String pwd) async {
    Res<Resp?> res = await RequestHelper.standardRequestNoAuth(
      NetworkPathCollector.auth.loginCode,
      HttpMethod.POST,
      {
        'email':email,
        'password':pwd,
        'device_type':DeviceInfo.deviceType,
      }
    );
    if (!res.isSuccess) return res.to<UserAuthParams>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      AuthedUser authedUser = AuthedUser.fromJson(resp.data);
      return Res.successWithData(UserAuthParams.fromAuthedUser(authedUser));
    }
    return Res.failedMayWithMsg(resp.code, resp.message);
  }
}