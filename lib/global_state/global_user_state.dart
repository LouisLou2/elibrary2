import 'package:elibapp/entity/user_auth_params.dart';

class GlobalUserState{
  static late UserAuthParams authedParams;

  static get AT => authedParams.at;
  static get RT => authedParams.rt;

  static set user(UserAuthParams user){
    authedParams = user;
  }
}