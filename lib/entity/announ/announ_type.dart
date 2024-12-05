import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'code')
enum AnnounType {
  EventNotification(0, "事件通知"),
  OpenHoursAdjust(1, "营业时间调整"),
  NewServiceIntro(2, "新服务介绍"),
  ServiceAdjust(3, "服务调整"),
  CollectionChange(4, "馆藏变化"),
  Emergency(5, "紧急通知"),
  ReaderSurvey(6, "读者调查"),
  NewBookIntro(7, "新书介绍"),
  Other(8, "其他");

  final int code;
  final String tag; // 新增的 String tag 字段

  // 修改构造函数，增加 tag 参数
  const AnnounType(this.code, this.tag);

  // 获取 tag 的方法
  String getTag() {
    return tag;
  }
}