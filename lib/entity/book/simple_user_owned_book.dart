import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/simple_user_owned_book.g.dart';

@collection
@JsonSerializable()
class SimpleUserOwnedBook {

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  @JsonKey(name: 'shelf_ele_id')
  @Index(unique: true, replace: true)
  int shelfEleId;

  String isbn;

  String title;

  @JsonKey(name: 'cover_m_url')
  String coverMUrl;

  DateTime time;

  int category1;

  @JsonKey(name: 'category1_name')
  String category1Name;

  int status;

  @Index(composite: [CompositeIndex('time')])
  @JsonKey(includeFromJson: false)
  late int userId;

  // Constructor: All fields are required (non-nullable)
  SimpleUserOwnedBook({
    required this.shelfEleId,
    required this.isbn,
    required this.title,
    required this.coverMUrl,
    required this.time,
    required this.category1,
    required this.category1Name,
    required this.status,
  });


  // JSON serialization methods
  factory SimpleUserOwnedBook.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserOwnedBookFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleUserOwnedBookToJson(this);
}