import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/features/categories/repo/cate_repo.dart';
import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/app_strings.dart';
import '../../../shared/widget/custom_image_tile.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../bloc/cate_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '分类',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: RepositoryProvider.value(
          value: GetIt.I<CateRepo>(),
          child: BlocProvider(
            create: (context) => CateBloc(),
            lazy: false,
            child: BlocBuilder<CateBloc, CateState>(
              builder: (context, state) {
                if (state == CateState.retry){
                  return Center(
                    child: ReloadWidget(
                      tile: AppStrs.youOffline,
                      subtitle: AppStrs.tryReconnect,
                      onReload: () => context.read<CateBloc?>()?.add(CateEvent.reqRefreshNowNoData),
                    ),
                  );
                }
                if (state == CateState.loadingNowNoData){
                  return const Center(child: CircularProgressIndicator());
                }
                if (state == CateState.refreshLocal || state == CateState.refreshNet){
                  final CateRepo repo = context.read<CateRepo>();
                  final List<BookCate> cateList = repo.currentCategories1;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 110,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 14,
                    ),
                    itemCount: cateList.length,
                    itemBuilder: (BuildContext context, int i) {
                      BookCate cate = cateList[i];
                      return CustomImageTile(
                        title: cate.cateName,
                        subTitle: '${cate.bookNum}本书',
                        onTap: () {},
                        image: getCustomCachedImage(
                          url: cate.coverUrl,
                          width: 60,
                        ),
                        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                      );
                    },
                  );
                }
                throw Exception('state not found');
              },
            ),
          ),
        ),
      ),
    );
  }
}