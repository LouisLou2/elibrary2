import 'package:json_annotation/json_annotation.dart';

abstract class Animal {
  @JsonKey(name: 'wow_name')
  String name;
  @JsonKey(name: 'animal_age')
  int age;
  Animal(this.name, this.age);
}