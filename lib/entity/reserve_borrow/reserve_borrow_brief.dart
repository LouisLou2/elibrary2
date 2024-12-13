import 'package:elibapp/util/format_tool.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/reserve_borrow_enum.dart';
part '../../generated/reserve_borrow/reserve_borrow_brief.g.dart'; // 生成的文件

@collection
@JsonSerializable()
class ReserveBorrowBrief {

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  @JsonKey(includeFromJson: false, includeToJson: true)
  @Index(composite: [CompositeIndex('status')])
  int userId = -1;

  @Index(unique: true, replace: true)
  @JsonKey(name: 'reserve_id')
  final int reserveId;

  @Enumerated(EnumType.value, 'code')
  final ReserveBorrowStatus status;

  final String title;

  final String isbn;

  @Index()
  @JsonKey(name: 'reserve_time')
  final DateTime reserveTime;

  @JsonKey(name: 'pick_up_deadline')
  final DateTime pickUpDeadline;

  @JsonKey(name: 'due_time')
  final DateTime dueTime;

  @JsonKey(name: 'cover_m_url')
  final String coverMUrl;

  ReserveBorrowBrief({
    required this.reserveId,
    required this.status,
    required this.title,
    required this.isbn,
    required this.reserveTime,
    required this.pickUpDeadline,
    required this.dueTime,
    required this.coverMUrl,
  });

  void setUserId(int userId) {
    this.userId = userId;
  }

  bool paramSet() => userId != -1;

  String get deadlineStr => FormatTool.ymdhmsStr(status.picked ? dueTime : pickUpDeadline);

  // 生成序列化和反序列化的代码
  factory ReserveBorrowBrief.fromJson(Map<String, dynamic> json) =>
      _$ReserveBorrowBriefFromJson(json);

  Map<String, dynamic> toJson() => _$ReserveBorrowBriefToJson(this);
}