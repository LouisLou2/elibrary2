// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/book/cate_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CateDetail _$CateDetailFromJson(Map<String, dynamic> json) => CateDetail(
      BookCate.fromJson(json['cate'] as Map<String, dynamic>),
      (json['books'] as List<dynamic>)
          .map((e) => BookBriefAbs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CateDetailToJson(CateDetail instance) =>
    <String, dynamic>{
      'cate': instance.cate,
      'books': instance.books,
    };
