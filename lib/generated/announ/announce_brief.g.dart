// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/announ/announce_brief.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnounceBrief _$AnnounceBriefFromJson(Map<String, dynamic> json) =>
    AnnounceBrief(
      announcementId: (json['announcement_id'] as num).toInt(),
      sendingTime: DateTime.parse(json['sending_time'] as String),
      expiryTime: DateTime.parse(json['expiry_time'] as String),
      title: json['title'] as String,
      category: $enumDecode(_$AnnounTypeEnumMap, json['category']),
      editorId: (json['editor_id'] as num).toInt(),
      cover: json['cover'] as String?,
    );

Map<String, dynamic> _$AnnounceBriefToJson(AnnounceBrief instance) =>
    <String, dynamic>{
      'announcement_id': instance.announcementId,
      'sending_time': instance.sendingTime.toIso8601String(),
      'expiry_time': instance.expiryTime.toIso8601String(),
      'title': instance.title,
      'category': _$AnnounTypeEnumMap[instance.category]!,
      'editor_id': instance.editorId,
      'cover': instance.cover,
    };

const _$AnnounTypeEnumMap = {
  AnnounType.EventNotification: 0,
  AnnounType.OpenHoursAdjust: 1,
  AnnounType.NewServiceIntro: 2,
  AnnounType.ServiceAdjust: 3,
  AnnounType.CollectionChange: 4,
  AnnounType.Emergency: 5,
  AnnounType.ReaderSurvey: 6,
  AnnounType.NewBookIntro: 7,
  AnnounType.Other: 8,
};
