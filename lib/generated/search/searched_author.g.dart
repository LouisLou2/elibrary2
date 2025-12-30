// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/search/searched_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedAuthor _$SearchedAuthorFromJson(Map<String, dynamic> json) =>
    SearchedAuthor(
      authorId: (json['author_id'] as num).toInt(),
      name: json['name'] as String,
      bookCount: (json['book_count'] as num).toInt(),
    );

Map<String, dynamic> _$SearchedAuthorToJson(SearchedAuthor instance) =>
    <String, dynamic>{
      'author_id': instance.authorId,
      'name': instance.name,
      'book_count': instance.bookCount,
    };
