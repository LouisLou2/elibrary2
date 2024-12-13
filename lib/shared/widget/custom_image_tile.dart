import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class CustomImageTile extends StatelessWidget{

  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  final Widget image;
  final EdgeInsetsGeometry? padding;
  final bool bottomDivider;
  final Widget? customTitleWidget;
  final bool circleImage;
  final Color? surfaceColor;
  final Color? surfaceColor2;
  final Color? backgroundColor;
  final Widget? actionWidget;
  double? fontSize;
  final double? fontSize2;
  final double? fontSize3;
  final double? actionSize;
  final VoidCallback? onTap;

  CustomImageTile({
    super.key,
    required this.title,
    this.subTitle,
    this.thirdTitle,
    required this.image,
    this.padding,
    this.bottomDivider=false,
    this.circleImage=false,
    this.surfaceColor,
    this.backgroundColor,
    this.actionWidget,
    this.fontSize,
    this.fontSize2,
    this.fontSize3,
    this.actionSize,
    this.onTap,
    this.customTitleWidget,
    this.surfaceColor2
  });

  @override
  Widget build(BuildContext context) {
    fontSize ??= Theme.of(context).textTheme.titleMedium?.fontSize??16;
    return Padding(
      padding: padding??const EdgeInsets.symmetric(horizontal: 2,vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
            border: !bottomDivider ? null: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                        color: surfaceColor,
                        fontSize: fontSize,
                      ),
                    ),
                    if(subTitle!=null)
                      Text(
                        subTitle!,
                        style: TextStyle(
                          color: surfaceColor2 ?? Theme.of(context).hintColor,
                          fontSize: fontSize2 ?? fontSize!*0.85,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    SizedBox(height: fontSize!*0.5,),
                    if(thirdTitle!=null)
                      Text(
                        thirdTitle!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: fontSize3 ?? fontSize!*0.75,
                        ),
                      ),
                    if(customTitleWidget!=null)
                      customTitleWidget!,
                  ],
                ),
              ),
              Card(
                color: backgroundColor,
                clipBehavior: Clip.antiAlias,
                shape: circleImage?const CircleBorder():RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(UiSize.border.tinyBorderR),
                ),
                child: image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}