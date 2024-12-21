import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/book_cate.g.dart'; // 生成的文件

@collection
@JsonSerializable()
class BookCate implements Comparable<BookCate>{

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  @JsonKey(name: "parent_id")
  int parentId;

  @JsonKey(name: 'cate_id')
  @Index(unique: true, replace: true)
  final int cateId;

  @JsonKey(name: 'cate_name')
  final String cateName;

  @JsonKey(name: 'cover_url')
  final String coverUrl;

  @JsonKey(name: 'book_num')
  final int bookNum;

  @JsonKey(name: 'dom_color')
  final int domColor; // long 类型的值在 Dart 中用 int 表示

  final String desc;

  BookCate({
    required this.parentId,
    required this.cateId,
    required this.cateName,
    required this.coverUrl,
    required this.bookNum,
    required this.domColor,
    required this.desc,
  });

  // 生成 JSON 序列化相关方法
  factory BookCate.fromJson(Map<String, dynamic> json) => _$BookCateFromJson(json);
  Map<String, dynamic> toJson() => _$BookCateToJson(this);

  @override
  int compareTo(BookCate other) {
    // use cateId to compare
    return cateId - other.cateId;
  }
}