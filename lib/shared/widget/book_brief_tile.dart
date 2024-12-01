import 'dart:math';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class BookBriefTile extends StatelessWidget{
  final String title;
  final double titleSize;
  final Widget image;
  final List<String> authors;
  final VoidCallback? onTap;

  const BookBriefTile({
    super.key,
    required this.title,
    required this.titleSize,
    required this.image,
    required this.authors,
    this.onTap,
  });

  List<Widget> _getAuthors(BuildContext context){
    List<Widget> authorWidgets = [];
    for (int i = 0; i < min(2, authors.length); i++){
      authorWidgets.add(
        Text(
          authors[i],
          style: TextStyle(
            fontSize: titleSize * 0.65,
            color: Theme.of(context).hintColor,
          ),
        ),
      );
    }
    return authorWidgets;
  }


  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiSize.border.tinyBorderR),
              side: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 0.5,
              ),
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
                  title,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.6,
                    fontSize: titleSize,
                  ),
                ),
                ..._getAuthors(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
