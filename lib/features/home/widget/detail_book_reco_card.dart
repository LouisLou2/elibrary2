import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:flutter/material.dart';

class DetailBookRecoCard extends StatelessWidget{
  final BookBriefReco book;
  final VoidCallback onTap;
  const DetailBookRecoCard({super.key, required this.book, required this.onTap});

  List<Widget> _getAuthors(){
    List<Widget> authors = [];
    for (String author in book.authorNames){
      authors.add(
        Text(
          author,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      );
    }
    return authors;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(book.coverDomColor),
              width: 0.5,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                  decoration: BoxDecoration(
                    color: Color(book.coverDomColor).withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomCachedImage(
                        url: book.coverMUrl,
                        width: 115,
                        height: 165,
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
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                ..._getAuthors(),
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
                                child: const Text(
                                  '查看详情',
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
                  color: Color(book.coverDomColor).withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: const Text(
                  '即时翻译文本&完整的文档文件。为个人和团队提供准确的翻译和语言服务。',
                  style: TextStyle(
                    fontSize: 16,
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