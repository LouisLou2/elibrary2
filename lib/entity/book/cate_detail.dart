import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/book/book_cate.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../generated/book/cate_detail.g.dart';

@JsonSerializable()
class CateDetail{
  BookCate cate;
  List<BookBriefAbs> books;

  CateDetail(this.cate, this.books);

  factory CateDetail.fromJson(Map<String, dynamic> json) => _$CateDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CateDetailToJson(this);
}