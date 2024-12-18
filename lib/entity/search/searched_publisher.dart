import 'package:elibapp/entity/search/searched_result.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/search/searched_publisher.g.dart';

@JsonSerializable()
class SearchedPublisher extends SearchedResult{
  @JsonKey(name: 'publisher_id')
  final int publisherId; // 非空字段

  @JsonKey(name: 'publisher_name')
  final String publisherName; // 非空字段

  @JsonKey(name: 'book_count')
  final int bookCount; // 非空字段，书籍总数

  // 构造函数要求所有字段都非空
  SearchedPublisher({
    required this.publisherId,
    required this.publisherName,
    required this.bookCount,
  });

  // 使用生成的 _$SearchedPublisherFromJson 和 _$SearchedPublisherToJson 方法
  factory SearchedPublisher.fromJson(Map<String, dynamic> json) =>
      _$SearchedPublisherFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedPublisherToJson(this);

  String get initialLetter => publisherName.isEmpty ? '?' : publisherName[0].toUpperCase();
}