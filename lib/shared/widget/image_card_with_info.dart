import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class ImageInfoBox extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget image;
  final String title;
  final String? subTitle;
  final Color? surfaceColor;
  final double? fontSize;
  final double maxWidth;

  const ImageInfoBox({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
    this.surfaceColor,
    this.fontSize,
    this.onTap,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
            ),
            child: image,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: surfaceColor ?? Theme.of(context).hintColor,
                      letterSpacing: -1,
                    ),
                  ),
                  if(subTitle!=null)
                    Text(
                      subTitle!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize!=null ? fontSize! * 0.8 : null,
                        color: surfaceColor ?? Theme.of(context).hintColor,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}