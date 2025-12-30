// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/book_brief_abs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookBriefAbs _$BookBriefAbsFromJson(Map<String, dynamic> json) => BookBriefAbs(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      shortDesc: json['short_desc'] as String,
      authorNames: (json['author_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      publisherName: json['publisher_name'] as String,
      coverSUrl: json['cover_s_url'] as String,
      coverMUrl: json['cover_m_url'] as String,
      coverDomColor: (json['cover_dom_color'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      hasEbook: json['has_ebook'] as bool,
    );

Map<String, dynamic> _$BookBriefAbsToJson(BookBriefAbs instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'short_desc': instance.shortDesc,
      'author_names': instance.authorNames,
      'publisher_name': instance.publisherName,
      'cover_s_url': instance.coverSUrl,
      'cover_m_url': instance.coverMUrl,
      'cover_dom_color': instance.coverDomColor,
      'rating': instance.rating,
      'has_ebook': instance.hasEbook,
    };
