import 'package:json_annotation/json_annotation.dart';

import 'announ_type.dart';

part '../../generated/announ/announce_brief.g.dart';

@JsonSerializable()
class AnnounceBrief {
  @JsonKey(name: 'announcement_id')
  final int announcementId;

  @JsonKey(name: 'sending_time')
  final DateTime sendingTime;

  @JsonKey(name: 'expiry_time')
  final DateTime expiryTime;

  final String title;

  final AnnounType category;

  @JsonKey(name: 'editor_id')
  final int editorId;

  final String? cover;

  AnnounceBrief({
    required this.announcementId,
    required this.sendingTime,
    required this.expiryTime,
    required this.title,
    required this.category,
    required this.editorId,
    this.cover,
  });

  // Factory constructor for JSON deserialization
  factory AnnounceBrief.fromJson(Map<String, dynamic> json) => _$AnnounceBriefFromJson(json);

  // Method for JSON serialization
  Map<String, dynamic> toJson() => _$AnnounceBriefToJson(this);

  bool get hasCover => cover != null;
}