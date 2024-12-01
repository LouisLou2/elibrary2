import 'package:flutter/material.dart';

Widget customFilledButton({
  required context,
  required String text,
  required VoidCallback onPressed,
  Color? backgroundColor,
  Color? textColor,
  double? vPadding,
  double? radius,
 }){
  return FilledButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius?? 5),
        ),
      ),
    ),
    onPressed: onPressed,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: vPadding ?? 14),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: textColor?? Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ),
  );
}