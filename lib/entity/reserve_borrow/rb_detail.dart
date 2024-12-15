import 'package:json_annotation/json_annotation.dart';
import '../../common/reserve_borrow_enum.dart';

part '../../generated/reserve_borrow/rb_detail.g.dart';

@JsonSerializable()
class RBDetail {
  @JsonKey(name: 'reserve_id')
  final int reserveId; // reserve_id

  @JsonKey(name: 'user_id')
  final int userId; // user_id

  @JsonKey(name: 'reserve_time')
  final DateTime reserveTime; // reserve_time

  final DateTime deadline; // deadline

  final String isbn; // isbn

  final ReserveBorrowStatus status; // status

  @JsonKey(name: 'book_unq_id')
  final int bookUnqId; // book_unq_id

  @JsonKey(name: 'lib_id')
  final int libId; // lib_id

  @JsonKey(name: 'pickup_time')
  final DateTime? pickUpTime; // pickup_time

  @JsonKey(name: 'return_time')
  final DateTime? returnTime; // return_time

  @JsonKey(name: 'due_time')
  final DateTime dueTime; // due_time

  @JsonKey(name: 'librarian_id')
  final int? librarianId; // librarian_id (non-nullable)

  @JsonKey(name: 'fee_id')
  final int? feeId; // fee_id (non-nullable)

  final String title; // title

  final String location; // location

  @JsonKey(name: 'lib_name')
  final String libName; // lib_name

  @JsonKey(name: 'lib_phone')
  final String libPhone; // lib_phone

  @JsonKey(name: 'lib_email')
  final String libEmail; // lib_email

  @JsonKey(name: 'one_author')
  final String oneAuthorName; // one_author_name

  @JsonKey(name: 'cover_m_url')
  final String coverMUrl; // cover_m_url

  RBDetail({
    required this.reserveId,
    required this.userId,
    required this.reserveTime,
    required this.deadline,
    required this.isbn,
    required this.status,
    required this.bookUnqId,
    required this.libId,
    this.pickUpTime,
    this.returnTime,
    required this.dueTime,
    this.librarianId,
    this.feeId,
    required this.title,
    required this.location,
    required this.libName,
    required this.libPhone,
    required this.libEmail,
    required this.oneAuthorName,
    required this.coverMUrl,
  });

  factory RBDetail.fromJson(Map<String, dynamic> json) => _$RBDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RBDetailToJson(this);
}