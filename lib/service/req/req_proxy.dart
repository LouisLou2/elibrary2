// 用于双token验证的代理类
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elibapp/common/http_status_code.dart';
import 'package:elibapp/service/req/requester.dart';

import '../../../common/http_method.dart';
import '../../../common/res_enum.dart';
import '../../../entity/res.dart';
import '../../../entity/resp.dart';
import '../../helper/exception/global_exception_handler.dart';
import '../../helper/network/net_manager.dart';

class ReqProxy extends Requester{

  bool _isRefreshingAT = false;

  bool enableProxy = false;
  Completer<void>? _completer;
  final String Function() _getAT;

  // 这个函数会自动获取并更新at，返回结果是否成功，如果成功，_getAT返回的就是新的at
  final Future<ResCodeEnum> Function() _atRetriver;

  ReqProxy(
    this._getAT,
    this._atRetriver){
    enableProxy = true;
  }

  Future<Res<Resp?>> req(
    String path,
    HttpMethod method,
    Map<String,dynamic> data
  ) async {
    assert (enableProxy);
    try {
      Response resp = await NetManager.normalDio.request(
        path,
        options: Options(
          method: method.value,
          headers: {
            'Authorization': 'Bearer ${_getAT()}'
          }
        ),
        data: data
      );
      if (resp.statusCode == HttpStatusCode.OK.value) {
        return Res.successWithData(Resp.fromJson(resp.data));
      } else if (resp.statusCode == HttpStatusCode.UNAUTHORIZED.value){
        // 这里如果是401，需要刷新token
        // 如果正在刷新,就等待
        if (_isRefreshingAT) {
          assert (_completer != null);
          await _completer!.future;
          return req(path, method, data);
        } else {
          // 说明需要刷新token
          _isRefreshingAT = true;
          _completer = Completer();
          ResCodeEnum resCode = await _atRetriver();
          if (resCode.isSuccess) {
            _isRefreshingAT = false;
            _completer!.complete();
            return req(path, method, data);
          } else {
            _isRefreshingAT = false;
            _completer!.complete();
            return Res.failed(resCode);
          }
        }
      } else {
        return Res.failed(ResCodeEnum.ServerError);
      }
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Res<Resp?>> standardRequestNoAuth(String path, HttpMethod method, Map<String, dynamic> data) async {
    try{
      Response resp = await NetManager.normalDio.request(
        path,
        options: Options(
          method: method.value,
        ),
        data: data
      );
      if (resp.statusCode == HttpStatusCode.OK.value) {
        return Res.successWithData(Resp.fromJson(resp.data));
      } else {
        return Res.failed(ResCodeEnum.ServerError);
      }
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

}