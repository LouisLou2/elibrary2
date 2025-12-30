// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/search/searched_publisher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedPublisher _$SearchedPublisherFromJson(Map<String, dynamic> json) =>
    SearchedPublisher(
      publisherId: (json['publisher_id'] as num).toInt(),
      publisherName: json['publisher_name'] as String,
      bookCount: (json['book_count'] as num).toInt(),
    );

Map<String, dynamic> _$SearchedPublisherToJson(SearchedPublisher instance) =>
    <String, dynamic>{
      'publisher_id': instance.publisherId,
      'publisher_name': instance.publisherName,
      'book_count': instance.bookCount,
    };
