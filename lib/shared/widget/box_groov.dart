import 'package:elibapp/shared/widget/forward_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxGroove extends StatelessWidget{

  final String? title;
  final VoidCallback? titleOnTap;
  final Color? titleColor;
  final double? titleFontSize;

  final List<Widget> widgets;
  const BoxGroove({super.key,required this.title,required this.widgets,this.titleOnTap,this.titleColor,this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    assert(title != null || titleOnTap == null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      if(title!=null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
          child: GestureDetector(
            onTap: titleOnTap,
            child: ForwardTitle(
              title: title!,
              onTap: titleOnTap,
              color: titleColor,
              size: titleFontSize,
            ),
          ),
        ),
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: widgets,
        ),
      ),
      ],
    );
  }
}