// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/publisher/publisher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Publisher _$PublisherFromJson(Map<String, dynamic> json) => Publisher(
      publisherId: (json['publisher_id'] as num).toInt(),
      publisherName: json['publisher_name'] as String,
      desc: json['desc'] as String,
      bookCount: (json['book_count'] as num).toInt(),
    );

Map<String, dynamic> _$PublisherToJson(Publisher instance) => <String, dynamic>{
      'publisher_id': instance.publisherId,
      'publisher_name': instance.publisherName,
      'desc': instance.desc,
      'book_count': instance.bookCount,
    };
