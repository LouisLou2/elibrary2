import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'app_theme.dart';

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
}