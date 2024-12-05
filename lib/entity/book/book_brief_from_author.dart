import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/book_brief_from_author.g.dart';

@JsonSerializable()
@collection
class BookBriefFromAuthor extends BookBriefAbs{

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  // 注意：这里的 authorId 和 order 需要从json解析后手动赋值
  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index()
  int authorId;

  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index(composite: [CompositeIndex('authorId')], unique: true, replace: true)
  int order;

  BookBriefFromAuthor({
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
    this.authorId = -1,
    this.order= -1
  });


  void setAuthorIdAndOrder(int authorId, int order) {
    this.authorId = authorId;
    this.order = order;
  }

  static void setAuthorIdAndOrderList(List<BookBriefFromAuthor> list, int authorId, int from) {
    assert(from>=0);
    for (var i = 0; i < list.length; i++) {
      list[i].order = from + i;
      list[i].authorId = authorId;
    }
  }

  // json
  factory BookBriefFromAuthor.fromJson(Map<String, dynamic> json) => _$BookBriefFromAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$BookBriefFromAuthorToJson(this);
}