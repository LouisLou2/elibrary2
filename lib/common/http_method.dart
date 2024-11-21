enum HttpMethod {
  GET('GET'),
  POST('POST'),
  PUT('PUT'),
  DELETE('DELETE');

  final String value;
  const HttpMethod(this.value);
}