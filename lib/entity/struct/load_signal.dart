import 'package:elibapp/common/res_enum.dart';

class LoadSignal{
  final ResCodeEnum _code;
  // 本次是否获得了更多数据，因为有的时候，即使请求成功，也可能没有更多数据了
  final bool _gotMoreData;

  const LoadSignal(this._code, this._gotMoreData);

  factory LoadSignal.success(bool gotMoreData) => LoadSignal(ResCodeEnum.Success, gotMoreData);
  factory LoadSignal.failed(ResCodeEnum code) => LoadSignal(code, false);

  bool get isReqSuccess => _code == ResCodeEnum.Success;
  bool get hasMoreData => _gotMoreData;
}