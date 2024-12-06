import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/book_cate.g.dart'; // 生成的文件

@JsonSerializable()
class BookCate {
  @JsonKey(name: 'cate_id')
  final int cateId;

  @JsonKey(name: 'cate_name')
  final String cateName;

  @JsonKey(name: 'cover_url')
  final String coverUrl;

  @JsonKey(name: 'book_num')
  final int bookNum;

  @JsonKey(name: 'dom_color')
  final int domColor; // long 类型的值在 Dart 中用 int 表示

  BookCate({
    required this.cateId,
    required this.cateName,
    required this.coverUrl,
    required this.bookNum,
    required this.domColor,
  });

  // 生成 JSON 序列化相关方法
  factory BookCate.fromJson(Map<String, dynamic> json) => _$BookCateFromJson(json);
  Map<String, dynamic> toJson() => _$BookCateToJson(this);
}