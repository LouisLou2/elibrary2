import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/entity/struct/sub_cate_book_signal.dart';
import 'package:elibapp/features/sub_cate_book/page/sub_cate_book_list.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCateBooksPage extends StatefulWidget{
  const SubCateBooksPage({super.key});
  @override
  State<SubCateBooksPage> createState()=>_CategoryBookState();
}

class _CategoryBookState extends State<SubCateBooksPage>{

  final ValueNotifier<int> _subCateIndex = ValueNotifier(0);

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    SubCateBookSignal signal = ModalRoute.of(context)!.settings.arguments as SubCateBookSignal;
    List<BookCate> subCates = signal.subCates;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          onPressed: () => NavigationHelper.pop(),
        ),
        title: Text(
          signal.parentCate.cateName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Wrap(
              runSpacing: -20,
              children: List.generate(
                subCates.length, (index) => ValueListenableBuilder<int>(
                  valueListenable: _subCateIndex,
                  builder: (context, value, _) => TextButton(
                    onPressed: () => _subCateIndex.value = index,
                    child: value == index ? Text(
                      subCates[index].cateName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ):
                    Text(
                      subCates[index].cateName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            child: Divider(
              color: Theme.of(context).dividerColor,
              thickness: 0.8,
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _subCateIndex,
            builder: (context, value, _ ) {
              print('@@@@@@@@@@@@@value: $value');
              return SubCateBookListPage(
                key: ValueKey(subCates[value].cateId),
                subCates[value].cateId,
              );
            },
          ),
        ],
      ),
    );
  }
}