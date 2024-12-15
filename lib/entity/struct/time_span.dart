import 'package:json_annotation/json_annotation.dart';

part '../../generated/struct/time_span.g.dart';

@JsonSerializable()
class TimeSpan {
  DateTime date;

  @JsonKey(name: 'hour_begin')
  int hourBegin;

  @JsonKey(name: 'hour_end')
  int hourEnd;

  TimeSpan({
    required this.date,
    required this.hourBegin,
    required this.hourEnd,
  });

  // 生成的工厂方法来从 JSON 创建实例
  factory TimeSpan.fromJson(Map<String, dynamic> json) => _$TimeSpanFromJson(json);

  // 生成的 toJson 方法来将实例转换为 JSON
  Map<String, dynamic> toJson() => _$TimeSpanToJson(this);
}