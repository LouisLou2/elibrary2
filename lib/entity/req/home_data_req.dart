import 'package:json_annotation/json_annotation.dart';

part '../../generated/req/home_data_req.g.dart'; // 用于生成代码

@JsonSerializable()
class HomeDataReq {
  @JsonKey(name: 'last_readed_announ_id')
  final int lastReadedAnnounId;

  @JsonKey(name: 'viewing_history_page_num')
  final int viewingHistoryPageSize;

  @JsonKey(name: 'reco_book_page_num')
  final int recoBookPageSize;

  @JsonKey(name: 'chart_page_num')
  final int chartPageSize;

  const HomeDataReq({
    required this.lastReadedAnnounId,
    required this.viewingHistoryPageSize,
    required this.recoBookPageSize,
    required this.chartPageSize,
  });

  factory HomeDataReq.fromJson(Map<String, dynamic> json) =>
      _$HomeDataReqFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataReqToJson(this);
}
