import 'package:elibapp/common/res_enum.dart';

class Resp {
  final ResCodeEnum code;
  final String? message;
  final dynamic data;

  Resp(this.code, this.message, this.data);

  factory Resp.fromJson(Map<String, dynamic> json){
    int numCode = (json['code'] as num).toInt();
    ResCodeEnum code = ResCodeEnum.fromCode(numCode);
    return Resp(
      code,
      json['message'],
      json['data']
    );
  }
}