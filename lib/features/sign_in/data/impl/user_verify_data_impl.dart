import 'package:elibapp/common/contact_type.dart';
import 'package:elibapp/entity/struct/res.dart';

import 'package:elibapp/global_state/device_info.dart';
import 'package:elibapp/helper/network/net_path_collector.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/req/home_data_req.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../entity/user/authed_user_with_data.dart';
import '../user_verify_data.dart';

class UserVerifyDataImpl implements UserVerifyData {

  Requester requester = GetIt.I<Requester>();

  @override
  Future<Res<void>> sendEmailCode(String email) async {
    Res<Resp?> res = await requester.standardRequestNoAuth(
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
  Future<Res<AuthedUserWithData>> verifyEmailCode(String email, String code, HomeDataReq homeDataReq) async{
    Res<Resp?> res = await requester.standardRequestNoAuth(
      NetworkPathCollector.auth.loginCode,
      HttpMethod.POST,
      {
        ...{
        'email':email,
        'code':code,
        'device_type':DeviceInfo.deviceType
        },
        ...homeDataReq.toJson(),
      }
    );

    if (!res.isSuccess) return res.to<AuthedUserWithData>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      AuthedUserWithData data = AuthedUserWithData.fromJson(resp.data);
      return Res.successWithData(data);
    }
    return Res.failedMayWithMsg(resp.code, resp.message);
  }

  @override
  Future<Res<AuthedUserWithData>> verifyEmailPwd(String email, String pwd, HomeDataReq homeDataReq) async {
    Res<Resp?> res = await requester.standardRequestNoAuth(
      NetworkPathCollector.auth.loginPwd,
      HttpMethod.POST,
        {
          ...{
            'email':email,
            'password': pwd,
            'device_type':DeviceInfo.deviceType
          },
          ...homeDataReq.toJson(),
        }
    );
    if (!res.isSuccess) return res.to<AuthedUserWithData>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      AuthedUserWithData data = AuthedUserWithData.fromJson(resp.data);
      return Res.successWithData(data);
    }
    return Res.failedMayWithMsg(resp.code, resp.message);
  }
}