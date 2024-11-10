import 'package:elibapp/entity/user_auth_params.dart';
import 'package:isar/isar.dart';

abstract class AuthDataSource {
  UserAuthParams? get userAuthParams;
  Future<void> saveUserAuthParams(UserAuthParams userAuthParams);
}