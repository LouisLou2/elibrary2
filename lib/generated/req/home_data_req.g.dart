// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/req/home_data_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataReq _$HomeDataReqFromJson(Map<String, dynamic> json) => HomeDataReq(
      lastReadedAnnounId: (json['last_readed_announ_id'] as num).toInt(),
      viewingHistoryPageSize: (json['viewing_history_page_num'] as num).toInt(),
      recoBookPageSize: (json['reco_book_page_num'] as num).toInt(),
      chartPageSize: (json['chart_page_num'] as num).toInt(),
    );

Map<String, dynamic> _$HomeDataReqToJson(HomeDataReq instance) =>
    <String, dynamic>{
      'last_readed_announ_id': instance.lastReadedAnnounId,
      'viewing_history_page_num': instance.viewingHistoryPageSize,
      'reco_book_page_num': instance.recoBookPageSize,
      'chart_page_num': instance.chartPageSize,
    };
