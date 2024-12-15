import 'dart:ui';

import 'package:elibapp/common/reserve_borrow_enum.dart';

import '../../../style/ui_color.dart';

class RBDetailUiStrategy {
  static const List<Color> reserveBorrowStatusColor = [UiColor.silentBlue, UiColor.maroon, UiColor.deprecated, UiColor.silentBlue, UiColor.relieveGreen, UiColor.maroon, UiColor.deprecated];

  static Color getRBStatusColor(ReserveBorrowStatus status) {
    assert(status.code >= 0 && status.code < reserveBorrowStatusColor.length);
    return reserveBorrowStatusColor[status.code];
  }
}