import 'package:elibapp/entity/publisher/publisher.dart';
import 'package:json_annotation/json_annotation.dart';

import '../book/book_brief_abs.dart';

part '../../generated/publisher/pub_with_booklis.g.dart';

@JsonSerializable()
class PubWithBookLis {
  Publisher pub;

  List<BookBriefAbs> books;

  PubWithBookLis({
    required this.pub,
    required this.books,
  });

  factory PubWithBookLis.fromJson(Map<String, dynamic> json) => _$PubWithBookLisFromJson(json);

  Map<String, dynamic> toJson() => _$PubWithBookLisToJson(this);
}