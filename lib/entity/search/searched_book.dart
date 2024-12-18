import 'package:elibapp/entity/search/searched_result.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/search/searched_book.g.dart';

@JsonSerializable()
class SearchedBook extends SearchedResult{
  final String isbn; // 非空字段
  final String title; // 非空字段

  @JsonKey(name: 'author_names')
  final List<String> authorNames; // 非空字段

  final int rating; // 非空字段

  @JsonKey(name: 'cover_s_url')
  final String coverSUrl; // 非空字段

  // 构造函数要求所有字段都非空
  SearchedBook({
    required this.isbn,
    required this.title,
    required this.authorNames,
    required this.rating,
    required this.coverSUrl,
  });

  // 使用生成的 _$SearchedBookFromJson 和 _$SearchedBookToJson 方法
  factory SearchedBook.fromJson(Map<String, dynamic> json) =>
      _$SearchedBookFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedBookToJson(this);

  String get authorNamesStr => authorNames.join(' / ');
}
