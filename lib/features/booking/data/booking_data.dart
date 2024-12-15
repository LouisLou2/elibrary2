import 'package:elibapp/entity/lib/lib_time_span.dart';

import '../../../entity/reserve_borrow/rb_detail.dart';
import '../../../entity/struct/res.dart';

abstract class BookingData{
  Future<Res<List<LibTimeSpan>>> getLibTimeSpanList(String isbn);
  Future<Res<RBDetail>> book(int libId, String isbn, DateTime pickUpTime);
}