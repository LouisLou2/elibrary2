import '../../../common/http_method.dart';
import '../../entity/struct/res.dart';
import '../../../entity/struct/resp.dart';

abstract class Requester {
  Future<Res<Resp?>> req({
    required String path,
    required HttpMethod method,
    required Map<String,dynamic> data,
    int tryTimes,
  });

  Future<Res<Resp?>> standardRequestNoAuth(
    String path,
    HttpMethod method,
    Map<String,dynamic> data
  );
}