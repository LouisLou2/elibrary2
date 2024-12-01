import 'package:elibapp/style/ui_color.dart';
import 'package:flutter/material.dart';

import '../../style/ui_size.dart';

class ImageWithNameCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget image;
  final String text;
  final Color nameBarColor;
  final double fontSize;
  final double? borderRadius;

  const ImageWithNameCard({
    super.key,
    this.onTap,
    required this.image,
    required this.text,
    this.nameBarColor=Colors.grey,
    this.fontSize=16,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?? UiSize.border.smallBorderR),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // 图片
            image,
            // 模糊层
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
                    height: constraints.maxWidth * 0.18 * 1.4,
                    color: nameBarColor,
                    child: Center(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: UiColor.bwChooseUsingRGB(nameBarColor),
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}