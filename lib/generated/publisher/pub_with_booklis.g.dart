// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/publisher/pub_with_booklis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PubWithBookLis _$PubWithBookLisFromJson(Map<String, dynamic> json) =>
    PubWithBookLis(
      pub: Publisher.fromJson(json['pub'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>)
          .map((e) => BookBriefAbs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PubWithBookLisToJson(PubWithBookLis instance) =>
    <String, dynamic>{
      'pub': instance.pub,
      'books': instance.books,
    };
