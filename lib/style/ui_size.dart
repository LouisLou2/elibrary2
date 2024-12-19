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
  final double mediumBorderR=8;
  final double largeBorderR=12;
  final double largerBorderR=16;

  const UiSizeBorder._();
}

class UISizePadding {
  final double tinyPadding=2;
  final double smallPadding=4;
  final double normalPadding=8;
  final double mediumPadding=12;
  final double largePadding=16;
  final double largerPadding=20;

  const UISizePadding._();
}

class UiSizeIconText{
  final double iconSmall = 10;

  const UiSizeIconText._();
}


class UiSize {
  static const UiSizeGap gap = UiSizeGap._();
  static const UiSizeBorder border = UiSizeBorder._();
  static const UISizePadding padding = UISizePadding._();
  static const UiSizeIconText iconText = UiSizeIconText._();
}