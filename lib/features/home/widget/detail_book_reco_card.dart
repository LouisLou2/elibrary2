import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:elibapp/style/ui_color.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/material.dart';

class DetailBookRecoCard extends StatelessWidget{
  final BookBriefReco book;
  final VoidCallback onTap;
  final Color? backColor;
  const DetailBookRecoCard({
    super.key,
    required this.book,
    required this.onTap,
    this.backColor,
  });

  List<Widget> _getAuthors(Color color){
    List<Widget> authors = [];
    for (String author in book.authorNames){
      authors.add(
        Text(
          author,
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return authors;
  }

  @override
  Widget build(BuildContext context) {
    Color domColor = Color(book.coverDomColor);
    Color backColorDown = domColor.withOpacity(0.5);
    Color backColorUpper = domColor.withOpacity(0.15);

    Color foreColorDom = UiColor.bwChooseUsingRGB(domColor);
    Color backgColor = backColor ?? Theme.of(context).colorScheme.surface;
    Color foreColorDown = UiColor.bwChooseUsingARGB(backColorDown,backgColor);
    Color foreColorUpper = UiColor.bwChooseUsingARGB(backColorUpper,backgColor);

    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 0.5,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                  decoration: BoxDecoration(
                    color: backColorUpper,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(UiSize.border.smallBorderR),
                      topRight: Radius.circular(UiSize.border.smallBorderR),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                        ),
                        child: getCustomCachedImage(
                          url: book.coverMUrl,
                          width: 115,
                          height: 165,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: foreColorUpper,
                                  ),
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                ..._getAuthors(foreColorUpper),
                              ]
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                  backgroundColor: Color(book.coverDomColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                  minimumSize: const Size(0, 0),
                                  elevation: 0,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  textStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                child: Text(
                                  '查看详情',
                                  style: TextStyle(
                                    color: foreColorDom,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                  color: backColorDown,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(UiSize.border.smallBorderR),
                    bottomRight: Radius.circular(UiSize.border.smallBorderR),
                  ),
                ),
                child: Text(
                  book.shortDesc,
                  style: TextStyle(
                    fontSize: 16,
                    color: foreColorDown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}