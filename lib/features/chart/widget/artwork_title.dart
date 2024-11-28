import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArtworkTitle extends StatelessWidget {

  final String title;
  final double size;
  final FontWeight fontWeight;
  final Color? color;

  const ArtworkTitle({
    super.key,
    required this.title,
    this.size = 24,
    this.fontWeight = FontWeight.w600,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/wreath_left.svg',
          colorFilter: ColorFilter.mode(color??Colors.black, BlendMode.srcIn),
          width: size * 1.2,
          height: size * 1.2,
        ),
        Text(title, style: TextStyle(fontSize: size,fontWeight: fontWeight,color: color),),
        SvgPicture.asset(
          'assets/icons/wreath_right.svg',
          colorFilter: ColorFilter.mode(color??Colors.black, BlendMode.srcIn),
          width: size * 1.2,
          height: size * 1.2,
        ),
      ],
    );
  }
}