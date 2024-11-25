import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/book_brief_hr.g.dart'; // 生成代码的位置

@JsonSerializable()
@collection
class BookBriefHR extends BookBriefAbs{

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  // 注意：这 order 需要从json解析后手动赋值
  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index(unique: true, replace: true)
  late int order;

  String isbn;
  String title;

  @JsonKey(name: 'author_names')
  List<String> authorNames;

  @JsonKey(name: 'publisher_name')
  String publisherName;

  @JsonKey(name: 'cover_s_url')
  String coverSUrl;

  @JsonKey(name: 'cover_m_url')
  String coverMUrl;

  int rating;

  @JsonKey(name: 'has_ebook')
  bool hasEbook;

  BookBriefHR({
    required this.isbn,
    required this.title,
    required this.authorNames,
    required this.publisherName,
    required this.coverSUrl,
    required this.coverMUrl,
    required this.rating,
    required this.hasEbook,
  });

  void setOrder(int order) {
    this.order = order;
  }

  factory BookBriefHR.fromJson(Map<String, dynamic> json) => _$BookBriefHRFromJson(json);

  Map<String, dynamic> toJson() => _$BookBriefHRToJson(this);
}