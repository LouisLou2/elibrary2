import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'book_brief_abs.dart';

part '../../generated/book/book_brief_reco.g.dart'; // 生成代码的位置

@JsonSerializable()
@collection
class BookBriefReco extends BookBriefAbs{

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  // 注意：这里的 userId 和 order 需要从json解析后手动赋值
  @JsonKey(includeFromJson: false, includeToJson: true)
  late int userId;

  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index(composite: [CompositeIndex('userId')], unique: true, replace: true)
  late int order;


  BookBriefReco({
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

  void setUserIdAndOrder(int userId, int order) {
    this.userId = userId;
    this.order = order;
  }

  static void setUserIdAndOrderList(List<BookBriefReco> list, int userId, int from) {
    assert(from>=0);
    for (var i = 0; i < list.length; i++) {
      list[i].order = from + i;
      list[i].userId = userId;
    }
  }

  factory BookBriefReco.fromJson(Map<String, dynamic> json) => _$BookBriefRecoFromJson(json);

  Map<String, dynamic> toJson() => _$BookBriefRecoToJson(this);
}
