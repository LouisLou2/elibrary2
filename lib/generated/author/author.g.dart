// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/author/author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      authorId: (json['author_id'] as num).toInt(),
      name: json['name'] as String,
      desc: json['desc'] as String,
      bookCount: (json['book_count'] as num).toInt(),
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'author_id': instance.authorId,
      'name': instance.name,
      'desc': instance.desc,
      'book_count': instance.bookCount,
    };
