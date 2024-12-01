import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'book_brief_abs.dart';

part '../../generated/book/book_brief_tb.g.dart'; // 生成代码的位置

@JsonSerializable()
@collection
class BookBriefTB extends BookBriefAbs{

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  // 注意：这 order 需要从json解析后手动赋值
  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index(unique: true, replace: true)
  late int order;

  BookBriefTB({
    required super.isbn,
    required super.title,
    required super.shortDesc,
    required super.authorNames,
    required super.publisherName,
    required super.coverSUrl,
    required super.coverMUrl,
    required super.coverDomColor,
    required super.rating,
    required super.hasEbook,
  });

  void setOrder(int order) {
    this.order = order;
  }

  factory BookBriefTB.fromJson(Map<String, dynamic> json) => _$BookBriefTBFromJson(json);

  Map<String, dynamic> toJson() => _$BookBriefTBToJson(this);

  static void setOrderForList(List<BookBriefTB> list, int from) {
    assert(from>=0);
    for (var i = 0; i < list.length; i++) {
      list[i].order = from + i;
    }
  }
}