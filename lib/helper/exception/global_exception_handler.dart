import 'package:dio/dio.dart';
import 'package:elibapp/common/http_status_code.dart';
import 'package:isar/isar.dart';

import '../../common/res_enum.dart';
import '../../entity/struct/res.dart';

class GlobalExceptionHelper{

  static Res<T> getErrorResInfo<T>(Object e){
    // network part
    if(e.runtimeType == DioException){
      DioException dioE = e as DioException;
      if(dioE.type == DioExceptionType.cancel){
        return Res.failed(ResCodeEnum.UserCancel);
      }
      else if(isTimeOutException(e)){
        return Res.failed(ResCodeEnum.ConnectionTimeout);
      }
      else if(dioE.type == DioExceptionType.connectionError){
        return Res.failed(ResCodeEnum.ConnectionError);
      }
      else if (dioE.type == DioExceptionType.badResponse && dioE.response?.statusCode == HttpStatusCode.UNAUTHORIZED.value){
        return Res.failed(ResCodeEnum.UnAuthorized);
      }
      return Res.failed(ResCodeEnum.UnknownNetworkError);
    }
    // database part
    if(e.runtimeType==IsarError){
      return Res.failed(ResCodeEnum.DbError);
    }
    // debug part
    return Res.failed(ResCodeEnum.Undefined);
  }

  // network part: timeout
  static bool isTimeOutException(DioException e){
    return e.type==DioExceptionType.sendTimeout||e.type==DioExceptionType.receiveTimeout||e.type==DioExceptionType.connectionTimeout;
  }
}