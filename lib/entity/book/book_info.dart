import 'package:elibapp/entity/book/book_brief_from_author.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:elibapp/entity/lib/sim_lib.dart';

part '../../generated/book/book_info.g.dart';

@collection
@JsonSerializable(explicitToJson: true)
class BookInfo {

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String isbn;

  String title;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'publisher_id')
  int publisherId;

  @JsonKey(name: 'publisher_name')
  String publisherName;

  @JsonKey(name: 'pub_date')
  DateTime pubDate;

  String desc;

  @JsonKey(name: 'short_desc')
  String shortDesc;

  @JsonKey(name: 'word_count')
  int wordCount;

  @JsonKey(name: 'lang_id')
  int langId;

  @JsonKey(name: 'lang_name')
  String langName;

  @JsonKey(name: 'cover_s_url')
  String coverSUrl;

  @JsonKey(name: 'cover_m_url')
  String coverMUrl;

  @JsonKey(name: 'cover_l_url')
  String coverLUrl;

  @JsonKey(name: 'cover_dom_color')
  int coverDomColor;

  int rating;

  @JsonKey(name: 'ebookUrl')
  String? ebookUrl;

  int category1;

  @JsonKey(name: 'category1_name')
  String category1Name;

  int category2;

  @JsonKey(name: 'category2_name')
  String category2Name;

  @JsonKey(name: 'author_ids')
  List<int> authorIds;

  @JsonKey(name: 'author_names')
  List<String> authorNames;

  @JsonKey(name: 'tag_ids')
  List<int> tagIds;

  @JsonKey(name: 'tag_names')
  List<String> tagNames;

  @Ignore()
  @JsonKey(name: 'available_libs')
  List<SimpleLib>? availableLibs; // 这里之所以是可以空，是为了isar不存储这个字段，但是后端发新数据时会有这个

  @Ignore()
  @JsonKey(name: 'related_books')
  List<BookBriefFromAuthor>? relatedBooks; // 这里之所以是可以空，是为了isar不在这里存储这个字段，BookBriefFromAuthor会存在一个单独的集合，并且后端一定会发这个字段

  BookInfo({
    required this.isbn,
    required this.title,
    required this.originalTitle,
    required this.publisherId,
    required this.publisherName,
    required this.pubDate,
    required this.desc,
    required this.shortDesc,
    required this.wordCount,
    required this.langId,
    required this.langName,
    required this.coverSUrl,
    required this.coverMUrl,
    required this.coverLUrl,
    required this.coverDomColor,
    required this.rating,
    this.ebookUrl,
    required this.category1,
    required this.category1Name,
    required this.category2,
    required this.category2Name,
    required this.authorIds,
    required this.authorNames,
    required this.tagIds,
    required this.tagNames,
    this.availableLibs,
    this.relatedBooks,
  });

  void processInternal(){
    if (relatedBooks != null) {
      assert (authorIds.isNotEmpty);
      BookBriefFromAuthor.setAuthorIdAndOrderList(relatedBooks!,authorIds[0], 0);
    }
  }

  bool internalProcessedOrNull(){
    for (var i = 0; i < relatedBooks!.length; i++) {
      if (relatedBooks![i].authorId == -1) return false;
    }
    if (relatedBooks == null) return true;
    for (var i = 0; i < relatedBooks!.length; i++) {
      if (relatedBooks![i].order == -1) return false;
    }
    return true;
  }

  bool get hasEbook => ebookUrl != null;

  bool get libAvailable => availableLibs != null && availableLibs!.isNotEmpty;

  factory BookInfo.fromJson(Map<String, dynamic> json) => _$BookInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookInfoToJson(this);
}