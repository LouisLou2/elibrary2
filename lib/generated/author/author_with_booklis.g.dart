// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/author/author_with_booklis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorWithBookLis _$AuthorWithBookLisFromJson(Map<String, dynamic> json) =>
    AuthorWithBookLis(
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>)
          .map((e) => BookBriefAbs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthorWithBookLisToJson(AuthorWithBookLis instance) =>
    <String, dynamic>{
      'author': instance.author,
      'books': instance.books,
    };
