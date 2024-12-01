class UiSizeGap {
  final double smallGap=5;
  final double mediumGap=12;
  final double largeGap=22;
  final double largerGap=28;
  final double hugeGap=32;

  const UiSizeGap._();
}

class UiSizeBorder {
  final double tinyBorderR=2;
  final double smallBorderR=4;
  final double normalBorderR=6;

  const UiSizeBorder._();
}



class UiSize {
  static const UiSizeGap gap = UiSizeGap._();
  static const UiSizeBorder border = UiSizeBorder._();
}