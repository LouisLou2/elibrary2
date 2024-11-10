import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elibapp/helper/network/request_result.dart';
import '../../common/res_enum.dart';
import '../../entity/res.dart';
import '../../entity/resp.dart';
import '../exception/global_exception_handler.dart';
import 'net_manager.dart';

enum HttpMethod {
  GET('GET'),
  POST('POST'),
  PUT('PUT'),
  DELETE('DELETE');

  final String value;
  const HttpMethod(this.value);
}

class RequestHelper{
  static Future<Res<Resp?>> standardRequestNoAuth(String path, HttpMethod method, Map<String,dynamic> data) async {
    try{
      Response resp = await NetManager.normalDio.request(
        path,
        options: Options(
          method: method.value,
        ),
        data: data
      );
      if (resp.statusCode == 200) {
        return Res.successWithData(Resp.fromJson(resp.data));
      } else {
        return Res.failed(ResCodeEnum.ServerError);
      }
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}