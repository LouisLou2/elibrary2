import 'package:flutter/material.dart';

import 'artwork_title.dart';

class ChartSideItem extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback onTap;

  // 构造函数
  const ChartSideItem({
    super.key,
    required this.name,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ColoredBox(
        color: selected
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).bottomSheetTheme.backgroundColor!,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            child: ArtworkTitle(
              title: name,
              size: 14,
              color: selected ? Theme.of(context).primaryColor : null,
            ),
          ),
        ),
      ),
    );
  }
}