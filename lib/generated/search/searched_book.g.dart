// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/search/searched_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedBook _$SearchedBookFromJson(Map<String, dynamic> json) => SearchedBook(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      authorNames: (json['author_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rating: (json['rating'] as num).toInt(),
      coverSUrl: json['cover_s_url'] as String,
    );

Map<String, dynamic> _$SearchedBookToJson(SearchedBook instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'author_names': instance.authorNames,
      'rating': instance.rating,
      'cover_s_url': instance.coverSUrl,
    };
