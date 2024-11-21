enum HttpStatusCode{
  OK(200),
  UNAUTHORIZED(401);

  final int value;
  const HttpStatusCode(this.value);
}