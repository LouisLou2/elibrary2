import 'package:json_annotation/json_annotation.dart';
import 'announ_type.dart';  // 假设 AnnounType 是另一个 enum 文件

part '../../generated/announ/announcement.g.dart';  // 生成的文件名

@JsonSerializable()
class Announcement {
  @JsonKey(name: 'announcement_id')
  final int announcementId;  // 对应 announcement_id

  @JsonKey(name: 'sending_time')
  final DateTime sendingTime;  // 对应 time

  @JsonKey(name: 'expiry_time')
  final DateTime expiryTime;  // 对应 expiry_time

  final String title;  // 对应 title

  final String content;  // 对应 content

  final AnnounType category;  // 对应 category

  @JsonKey(name: 'editor_id')
  final int editorId;  // 对应 editor_id

  final String? cover;

  Announcement({
    required this.announcementId,
    required this.sendingTime,
    required this.expiryTime,
    required this.title,
    required this.content,
    required this.category,
    required this.editorId,
    this.cover,
  });

  // 生成的fromJson和toJson方法
  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);

  bool get hasCover => cover != null;
}