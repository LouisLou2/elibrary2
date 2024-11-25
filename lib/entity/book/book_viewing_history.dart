import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/book_viewing_history.g.dart'; // 生成代码的位置

@JsonSerializable()
@collection
class BookViewingHistory {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  @JsonKey(name: 'user_id')
  @Index(composite: [CompositeIndex('isbn')],unique: true, replace: true)
  @Index()
  int userId;

  String isbn;

  String title;

  @JsonKey(name: 'author_names')
  List<String> authorNames;

  @JsonKey(name: 'publisher_name')
  String publisherName;

  @Index(composite: [CompositeIndex('userId')])
  @JsonKey(name: 'viewing_time')
  DateTime viewingTime;

  @JsonKey(name: 'cover_m_url')
  String coverMUrl;

  BookViewingHistory({
    required this.userId,
    required this.isbn,
    required this.title,
    required this.authorNames,
    required this.publisherName,
    required this.viewingTime,
    required this.coverMUrl,
  });

  factory BookViewingHistory.fromJson(Map<String, dynamic> json) =>
      _$BookViewingHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$BookViewingHistoryToJson(this);
}
