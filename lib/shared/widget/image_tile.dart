import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget{

  final EdgeInsetsGeometry? padding;
  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  final Widget image;
  final bool circleImage;
  final Color? surfaceColor;
  final Color? subtitleColor;
  final Color? backgroundColor;
  final Widget? actionWidget;
  final double? fontSize;
  final double? fontSize3;
  final FontWeight? titleWeight;
  final double? actionSize;
  final VoidCallback? onTap;
  final bool withDivider;

  const ImageTile({
    super.key,
    required this.title,
    this.subTitle,
    this.thirdTitle,
    required this.image,
    this.circleImage=false,
    this.surfaceColor,
    this.backgroundColor,
    this.actionWidget,
    this.fontSize,
    this.actionSize,
    this.onTap,
    this.subtitleColor,
    this.titleWeight,
    this.fontSize3,
    this.padding,
    this.withDivider=false,
  });

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: withDivider?Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ):null,
        ),
        padding: padding ?? const EdgeInsets.all(0),
        child: Row(
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              color: backgroundColor,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: circleImage ? const CircleBorder() : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UiSize.border.tinyBorderR),
              ),
              child: image,
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: titleWeight?? FontWeight.normal,
                      letterSpacing: -0.6,
                      color: surfaceColor,
                      fontSize: fontSize,
                    ),
                  ),
                  if(subTitle!=null)
                    Text(
                      subTitle!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: subtitleColor ?? Theme.of(context).hintColor,
                        fontSize: fontSize!=null?fontSize!*0.8:null,
                        letterSpacing: -0.6,
                      ),
                    ),
                  if(thirdTitle!=null)
                    Text(
                      thirdTitle!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: subtitleColor ?? Theme.of(context).colorScheme.secondary,
                        fontSize: fontSize3??(fontSize!=null?fontSize!*0.6:null),
                      ),
                    ),
                ],
              ),
            ),
            if(actionWidget!=null)
              actionWidget!,
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context){
  //   return ListTile(
  //     onTap: onTap,
  //     leading: Card(
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(UIParams.tinyBorderR),
  //       ),
  //       child: image,
  //     ),
  //     title: Text(
  //       title!,
  //       style: TextStyle(
  //         color: surfaceColor,
  //         fontSize: fontSize,
  //       ),
  //     ),
  //     subtitle: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         if(subTitle!=null)
  //           Text(
  //             subTitle!,
  //             style: TextStyle(
  //               color: surfaceColor,
  //               fontSize: fontSize!=null?fontSize!*0.8:null,
  //             ),
  //           ),
  //         if(thirdTitle!=null)
  //           Text(
  //             thirdTitle!,
  //             style: TextStyle(
  //               color: surfaceColor,
  //               fontSize: fontSize!=null?fontSize!*0.8:null,
  //             ),
  //           ),
  //       ],
  //     ),
  //     trailing: actionWidget,
  //   );
  // }
}
