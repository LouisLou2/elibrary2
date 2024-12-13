import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'code')
enum ReserveBorrowStatus {
  WaitingPickUp(0, '待取书'),
  OverduePickUp(1, '超时取消'),
  Cancelled(2, '用户取消'),
  WaitingReturn(3, '待还书'),
  Returned(4, '已还书'),
  OverdueReturn(5, '已逾期');

  const ReserveBorrowStatus(this.code, this.str);

  bool get picked => code >= 3;

  final int code;
  final String str;
}