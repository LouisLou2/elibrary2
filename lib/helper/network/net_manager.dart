import 'package:dio/dio.dart';
import 'package:elibapp/helper/network/request_config.dart';

import 'net_path_collector.dart';

class NetManager {
  // 默认的Dio实例,用于普通的网络请求(除聊天以及文件上传下载之外的请求)
  static final Dio _basicDio = Dio(
    BaseOptions(
      baseUrl: NetworkPathCollector.userApi,
      connectTimeout: RequestConfig.defaultTimeout,
      receiveTimeout: RequestConfig.defaultTimeout,
    ),
  );// 懒加载

  static final Dio _plainDio = Dio(
    BaseOptions(
      baseUrl: NetworkPathCollector.host,
      connectTimeout: RequestConfig.defaultTimeout,
      receiveTimeout: RequestConfig.defaultTimeout,
    ),
  );// 懒加载

  static Dio get normalDio=>_basicDio;
  static Dio get plainDio=>_plainDio;
}