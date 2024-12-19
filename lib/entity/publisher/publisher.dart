import 'package:json_annotation/json_annotation.dart';

part '../../generated/publisher/publisher.g.dart';

@JsonSerializable()
class Publisher {
  @JsonKey(name: 'publisher_id')
  final int publisherId;

  @JsonKey(name: 'publisher_name')
  final String publisherName;

  final String desc;

  @JsonKey(name: 'book_count')
  final int bookCount;

  Publisher({
    required this.publisherId,
    required this.publisherName,
    required this.desc,
    required this.bookCount,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherToJson(this);
}