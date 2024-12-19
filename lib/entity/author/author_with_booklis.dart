import 'package:json_annotation/json_annotation.dart';

import '../book/book_brief_abs.dart';
import 'author.dart';

part '../../generated/author/author_with_booklis.g.dart';

@JsonSerializable()
class AuthorWithBookLis {
  Author author;
  List<BookBriefAbs> books;

  AuthorWithBookLis({
    required this.author,
    required this.books
  });

  factory AuthorWithBookLis.fromJson(Map<String, dynamic> json) => _$AuthorWithBookLisFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorWithBookLisToJson(this);
}