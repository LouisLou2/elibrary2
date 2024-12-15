import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'book_brief_abs.dart';

part '../../generated/book/book_brief_sub_cate.g.dart'; // 生成代码的位置

@JsonSerializable()
@collection
class BookBriefSC extends BookBriefAbs{

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  // 注意：这 order 需要从json解析后手动赋值
  @JsonKey(includeFromJson: false, includeToJson: true)
  late int order;

  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index(composite: [CompositeIndex('order'),], unique: true, replace: true)
  late int subCateId;

  BookBriefSC({
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

  factory BookBriefSC.fromJson(Map<String, dynamic> json) => _$BookBriefSCFromJson(json);

  Map<String, dynamic> toJson() => _$BookBriefSCToJson(this);

  static void setOrderAndCateForList(List<BookBriefSC> list, int from, int subCateId) {
    assert(from>=0);
    for (var i = 0; i < list.length; i++) {
      list[i].order = from + i;
      list[i].subCateId = subCateId;
    }
  }
}