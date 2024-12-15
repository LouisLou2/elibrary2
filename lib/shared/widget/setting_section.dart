import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class SettingSection extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  const SettingSection({super.key, required this.children, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}