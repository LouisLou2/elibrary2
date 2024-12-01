import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';


class UiColor{
  static const Color error = Color(0xFFDF1D1D);
  static const Color success = Color(0xff199f19);
  static const Color warning = Color(0xFFF8BA00);

  static const Color deepBlue = Color(0xff0a3d62);

  static Color getColor(ToastificationType type){
    switch(type){
      case ToastificationType.error:
        return error;
      case ToastificationType.success:
        return success;
      case ToastificationType.warning:
        return warning;
      default:
        return warning;
    }
  }

  static Color argbToRgb(Color color, Color back){
    double alpha = color.alpha / 255;
    return Color.fromARGB(
      255,
      (color.red * alpha + back.red * (1 - alpha)).round(),
      (color.green * alpha + back.green * (1 - alpha)).round(),
      (color.blue * alpha + back.blue * (1 - alpha)).round(),
    );
  }

  static Color bwChooseUsingRGB(Color color){
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  static Color bwChooseUsingARGB(Color color, Color back){
    color = argbToRgb(color, back);
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}