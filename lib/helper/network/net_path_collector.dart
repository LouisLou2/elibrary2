// 这些route是需要持久化保存的，以应对后端api的变化,但是目前先不做这些了
import '../../config/network_config.dart';

class AuthPath{
  late final String base;
  late final String loginPwd;
  late final String loginCode;
  late final String sendCode;
  late final String retrieveAt;

  AuthPath(){
    base = "/auth";
    loginPwd = "$base/login/email_pwd";
    loginCode = "$base/login/email_code";
    sendCode = "$base/send_verify_code";
    retrieveAt = "$base/token/refresh_at";
  }
}

class AggregatedPath{
  late final String base;
  late final String getHomeData;

  AggregatedPath(){
    base = "/aggregated";
    getHomeData = "$base/home_data";
  }
}

class BookRecoPath{
  late final String base;
  late final String getRecommend;

  BookRecoPath(){
    base = "/book_reco";
    getRecommend = "$base/by_user";
  }
}


class NetworkPathCollector {
  static const String host = Configs.HOST;// server host
  static const String userApi = "$host/api/user";// dio的baseUrl，客户端一切请求都是基于这个baseUrl的

  static AuthPath auth = AuthPath();
  static BookRecoPath bookReco = BookRecoPath();
  static AggregatedPath aggregated = AggregatedPath();
}