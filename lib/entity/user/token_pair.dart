class TokenPair{
  String _at;
  String _rt;

  TokenPair(this._at, this._rt);

  // getter
  String get at => _at;
  String get rt => _rt;

  factory TokenPair.fromJson(Map<String, dynamic> json){
    return TokenPair(
      json['at'],
      json['rt']
    );
  }
}