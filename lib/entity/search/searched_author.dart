import 'package:elibapp/entity/search/searched_result.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/search/searched_author.g.dart';

@JsonSerializable()
class SearchedAuthor extends SearchedResult{
  @JsonKey(name: 'author_id')
  final int authorId; // 非空字段

  final String name; // 非空字段

  @JsonKey(name: 'book_count')
  final int bookCount; // 非空字段，书籍总数

  // 构造函数要求所有字段都非空
  SearchedAuthor({
    required this.authorId,
    required this.name,
    required this.bookCount,
  });

  // 使用生成的 _$SearchedAuthorFromJson 和 _$SearchedAuthorToJson 方法
  factory SearchedAuthor.fromJson(Map<String, dynamic> json) =>
      _$SearchedAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedAuthorToJson(this);

  String get initialLetter => name.isEmpty ? '?' : name[0].toUpperCase();
}