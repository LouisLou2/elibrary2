// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/reserve_borrow/rb_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RBDetail _$RBDetailFromJson(Map<String, dynamic> json) => RBDetail(
      reserveId: (json['reserve_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      reserveTime: DateTime.parse(json['reserve_time'] as String),
      deadline: DateTime.parse(json['deadline'] as String),
      isbn: json['isbn'] as String,
      status: $enumDecode(_$ReserveBorrowStatusEnumMap, json['status']),
      bookUnqId: (json['book_unq_id'] as num).toInt(),
      libId: (json['lib_id'] as num).toInt(),
      pickUpTime: json['pickup_time'] == null
          ? null
          : DateTime.parse(json['pickup_time'] as String),
      returnTime: json['return_time'] == null
          ? null
          : DateTime.parse(json['return_time'] as String),
      dueTime: DateTime.parse(json['due_time'] as String),
      librarianId: (json['librarian_id'] as num?)?.toInt(),
      feeId: (json['fee_id'] as num?)?.toInt(),
      title: json['title'] as String,
      location: json['location'] as String,
      libName: json['lib_name'] as String,
      libPhone: json['lib_phone'] as String,
      libEmail: json['lib_email'] as String,
      oneAuthorName: json['one_author'] as String,
      coverMUrl: json['cover_m_url'] as String,
    );

Map<String, dynamic> _$RBDetailToJson(RBDetail instance) => <String, dynamic>{
      'reserve_id': instance.reserveId,
      'user_id': instance.userId,
      'reserve_time': instance.reserveTime.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'isbn': instance.isbn,
      'status': _$ReserveBorrowStatusEnumMap[instance.status]!,
      'book_unq_id': instance.bookUnqId,
      'lib_id': instance.libId,
      'pickup_time': instance.pickUpTime?.toIso8601String(),
      'return_time': instance.returnTime?.toIso8601String(),
      'due_time': instance.dueTime.toIso8601String(),
      'librarian_id': instance.librarianId,
      'fee_id': instance.feeId,
      'title': instance.title,
      'location': instance.location,
      'lib_name': instance.libName,
      'lib_phone': instance.libPhone,
      'lib_email': instance.libEmail,
      'one_author': instance.oneAuthorName,
      'cover_m_url': instance.coverMUrl,
    };

const _$ReserveBorrowStatusEnumMap = {
  ReserveBorrowStatus.WaitingPickUp: 0,
  ReserveBorrowStatus.OverduePickUp: 1,
  ReserveBorrowStatus.Cancelled: 2,
  ReserveBorrowStatus.WaitingReturn: 3,
  ReserveBorrowStatus.Returned: 4,
  ReserveBorrowStatus.OverdueReturn: 5,
  ReserveBorrowStatus.CantReturn: 6,
};
