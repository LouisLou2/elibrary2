import 'package:dio/dio.dart';
import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/res.dart';
import 'package:elibapp/entity/user_auth_params.dart';
import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:isar/isar.dart';

import '../../../common/http_method.dart';
import '../../../common/http_status_code.dart';
import '../../../common/res_enum.dart';
import '../../../entity/resp.dart';
import '../../../helper/exception/global_exception_handler.dart';
import '../../../helper/network/net_manager.dart';

class AuthDataImpl implements AuthDataSource{

  @override
  UserAuthParams? get userAuthParams {
    return DBManager.db.userAuthParams.where().findFirstSync();
  }

  @override
  Future<void> saveUserAuthParams(UserAuthParams userAuthParams) async {
    DBManager.db.writeTxn(
      () async {
        await DBManager.db.userAuthParams.put(userAuthParams);
      }
    );
  }

  @override
  Future<Res<String>> getAccessToken() async{
    try{
      Response response = await NetManager.normalDio.request(
        'dontKnow',
        options: Options(
          method: HttpMethod.GET.value,
        ),
        data: {
          'dontKnow':'dontKnow'
        }
      );
      if (response.statusCode == HttpStatusCode.OK.value) {
        Resp resp = Resp.fromJson(response.data);
        return Res.successWithData(resp.data as String);
      } else {
        return Res.failed(ResCodeEnum.ServerError);
      }
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}