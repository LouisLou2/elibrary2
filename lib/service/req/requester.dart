import '../../../common/http_method.dart';
import '../../entity/struct/res.dart';
import '../../../entity/struct/resp.dart';

abstract class Requester {
  Future<Res<Resp?>> req(
    String path,
    HttpMethod method,
    Map<String,dynamic> data
  );

  Future<Res<Resp?>> standardRequestNoAuth(
    String path,
    HttpMethod method,
    Map<String,dynamic> data
  );
}