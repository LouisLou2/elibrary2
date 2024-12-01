import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class BookBriefAbs{
  // 注意：这 order 需要从json解析后手动赋值

  String isbn;

  String title;

  @JsonKey(name: 'short_desc')
  String shortDesc;

  @JsonKey(name: 'author_names')
  List<String> authorNames;

  @JsonKey(name: 'publisher_name')
  String publisherName;

  @JsonKey(name: 'cover_s_url')
  String coverSUrl;

  @JsonKey(name: 'cover_m_url')
  String coverMUrl;

  @JsonKey(name: "cover_dom_color")
  int coverDomColor;

  int rating;

  @JsonKey(name: 'has_ebook')
  bool hasEbook;


  BookBriefAbs({
    required this.isbn,
    required this.title,
    required this.shortDesc,
    required this.authorNames,
    required this.publisherName,
    required this.coverSUrl,
    required this.coverMUrl,
    required this.coverDomColor,
    required this.rating,
    required this.hasEbook,
  });

  String get authorNamesStr => authorNames.join('/');
}