import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class ColorPlaceHolder extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const ColorPlaceHolder({super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 圆角
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
      ),
      width: width,
      height: height,
    );
  }
}