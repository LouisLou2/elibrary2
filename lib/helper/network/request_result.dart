class RequestResult<T> {
  final bool success;
  final T? data;

  RequestResult(this.success, this.data);
  factory RequestResult.successWithData(T data) => RequestResult(true, data);
  factory RequestResult.failed() => RequestResult(false, null);
}