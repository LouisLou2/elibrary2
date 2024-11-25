import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:elibapp/helper/network/net_path_collector.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../common/http_method.dart';
import '../../../entity/struct/resp.dart';
import '../../../entity/user/user_auth_params.dart';
import '../../../helper/exception/global_exception_handler.dart';

class AuthDataImpl implements AuthDataSource{

  final Requester _requester = GetIt.I<Requester>();

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
  Future<Res<String>> getAccessToken(String rt) async{
    try{
      Res<Resp?> res = await _requester.standardRequestNoAuth(
        NetworkPathCollector.auth.retrieveAt,
        HttpMethod.GET,
        {
          'rt':rt,
        }
      );
      if(!res.isSuccess) return res.to<String>();
      return Res.successWithData(res.data!.data! as String);
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  void clearPersistedUser(int userId) {
    DBManager.db.writeTxn(
      () async {
        await DBManager.db.userAuthParams.deleteByUserId(userId);
      }
    );
  }
}