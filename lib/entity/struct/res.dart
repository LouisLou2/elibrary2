import 'package:elibapp/common/res_enum.dart';

class Res <T> {
  final ResCodeEnum code;
  final String? message;
  final T? data;

  Res(this.code, this.message, this.data);

  factory Res.successWithData(T data) => Res(ResCodeEnum.Success, null, data);
  factory Res.success() => Res(ResCodeEnum.Success, null, null);
  factory Res.failed(ResCodeEnum code) => Res(code, null, null);
  factory Res.failedWithMessage(ResCodeEnum code, String message) => Res(code, message, null);
  factory Res.failedMayWithMsg(ResCodeEnum code, String? message) => Res(code, message, null);

  bool get isSuccess => code == ResCodeEnum.Success;

  Res<S> to<S>() {
    return Res<S>(code, message, null);
  }
}