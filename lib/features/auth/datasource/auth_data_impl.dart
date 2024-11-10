import 'package:elibapp/base_manager/db_manager.dart';
import 'package:elibapp/entity/user_auth_params.dart';
import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:isar/isar.dart';

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
}