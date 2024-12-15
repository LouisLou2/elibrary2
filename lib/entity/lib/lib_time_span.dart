import 'package:json_annotation/json_annotation.dart';
import '../struct/time_span.dart';

part '../../generated/lib/lib_time_span.g.dart';

@JsonSerializable()
class LibTimeSpan {
  @JsonKey(name: 'lib_id')
  int libId;

  @JsonKey(name: 'lib_name')
  String libName;

  @JsonKey(name: 'time_spans')
  List<TimeSpan> timeSpans;

  LibTimeSpan({
    required this.libId,
    required this.libName,
    required this.timeSpans,
  });

  // 生成的工厂方法来从 JSON 创建实例
  factory LibTimeSpan.fromJson(Map<String, dynamic> json) => _$LibTimeSpanFromJson(json);

  // 生成的 toJson 方法来将实例转换为 JSON
  Map<String, dynamic> toJson() => _$LibTimeSpanToJson(this);
}