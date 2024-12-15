import 'package:equatable/equatable.dart';

sealed class BookingEvent extends Equatable {
  static const ReqReloadBasicsNowNoData reqReloadBasicsNowNoData = ReqReloadBasicsNowNoData();
  const BookingEvent();
  @override
  List<Object> get props => [];
}

class ReqReloadBasicsNowNoData extends BookingEvent {
  const ReqReloadBasicsNowNoData();
}

class ReqBooking extends BookingEvent {
  final int libIndex;
  final int dateIndex;
  final int timeIndex;
  const ReqBooking(this.libIndex, this.dateIndex, this.timeIndex);

  @override
  List<Object> get props => [libIndex, dateIndex, timeIndex];
}