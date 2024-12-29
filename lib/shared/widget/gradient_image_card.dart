import 'package:elibapp/style/ui_color.dart';
import 'package:flutter/material.dart';

class GradientImageCard extends StatelessWidget {
  final Widget image;
  final String? text;
  final double? textSize;
  final VoidCallback? onTap;
  final Color color;
  final double? borderRadius;
  const GradientImageCard({super.key, required this.image, this.text, this.onTap, required this.color, this.textSize, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child:Stack(
          fit: StackFit.expand,
          children: [
            // 背景图片
            image,
            // 渐变蒙版
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [0, 0.3, 1],
                  colors: [
                    color,
                    color.withOpacity(0.9),
                    Colors.transparent, // 渐变颜色的结束颜色，这里是完全透明
                  ],
                ),
              ),
            ),
            // 文字内容
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                text ?? '',
                style: TextStyle(
                  color: UiColor.bwChooseUsingRGB(color: color,threshold: 0.7),
                  fontSize: textSize ?? 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
