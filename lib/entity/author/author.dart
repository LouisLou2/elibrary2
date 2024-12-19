import 'package:json_annotation/json_annotation.dart';

part '../../generated/author/author.g.dart';

@JsonSerializable()
class Author {
  @JsonKey(name: 'author_id')
  final int authorId;

  final String name;

  final String desc;

  @JsonKey(name: 'book_count')
  final int bookCount; // 书籍总数

  Author({
    required this.authorId,
    required this.name,
    required this.desc,
    required this.bookCount,
  });

  // 从 JSON 转换到 Dart 对象
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  // 将 Dart 对象转换为 JSON
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
