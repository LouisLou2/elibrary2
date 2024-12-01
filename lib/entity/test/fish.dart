import 'package:json_annotation/json_annotation.dart';

import 'animal.dart';

part '../../generated/test/fish.g.dart';

@JsonSerializable()
class Fish extends Animal {
  @JsonKey(name: 'water_type')
  String waterType;

  @override
  int age;
  Fish(String name, this.age, this.waterType) : super(name, age);

  factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);
  Map<String, dynamic> toJson() => _$FishToJson(this);
}