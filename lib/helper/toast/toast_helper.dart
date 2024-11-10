import 'package:elibapp/common/res_enum.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../style/ui_color.dart';
import '../../style/ui_time.dart';

class ToastHelper {
  const ToastHelper._();

  static const Duration errorDuration=Duration(seconds: UiTime.snackBarDurationError);
  static const Duration warningDuration=Duration(seconds: UiTime.snackBarDurationWarning);
  static const Duration successDuration=Duration(seconds: UiTime.snackBarDurationSuccess);

  static Duration getDuration(ToastificationType type){
    switch(type){
      case ToastificationType.error:
        return errorDuration;
      case ToastificationType.success:
        return successDuration;
      case ToastificationType.warning:
        return warningDuration;
      default:
        return warningDuration;
    }
  }

  static void showToaster({
    required ResCodeEnum code,
    String? title,
    String? desc,
  }){
    showToasterRaw(
      type: code.toastType,
      title: title??code.msg,
      desc: desc,
    );
  }

  static void warn({
    required String title,
    String? desc,
  }){
    showToasterRaw(
      type: ToastificationType.warning,
      title: title,
      desc: desc,
    );
  }

  static void error({
    required String title,
    String? desc,
  }){
    showToasterRaw(
      type: ToastificationType.error,
      title: title,
      desc: desc,
    );
  }

  static void success({
    required String title,
    String? desc,
  }){
    showToasterRaw(
      type: ToastificationType.success,
      title: title,
      desc: desc,
    );
  }

  static void showToasterRaw({
    required ToastificationType type,
    required String title,
    String? desc,
  }){
    toastification
      ..dismissAll(delayForAnimation: false)
      ..show(
      type: type,
      style: ToastificationStyle.simple,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      description: desc==null?null: Text(
        desc,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: getDuration(type),
      backgroundColor: UiColor.getColor(type),
      foregroundColor: Colors.white,
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      showProgressBar: false,
      borderRadius: BorderRadius.circular(100.0),
    );
  }
}