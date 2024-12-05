import 'package:elibapp/shared/widget/spec/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../helper/nav/navigation_helper.dart';
import '../../../shared/widget/placeholder.dart';
import '../../../style/ui_size.dart';

class BookViewLoadingPage extends StatefulWidget{
  final String? coverUrl;
  const BookViewLoadingPage({super.key,this.coverUrl});
  @override
  State<BookViewLoadingPage> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookViewLoadingPage> {

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      extendBodyBehindAppBar: true, // must set to true
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: null,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        leading: IconButton(
          onPressed: () => NavigationHelper.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
      ),
      body: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: UiSize.padding.largePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: widget.coverUrl == null ? const ColorPlaceHolder(
                      width: 150,
                      height: 212,
                    ): getCustomCachedImage(url: widget.coverUrl!,width: 150,height: 212),
                  ),
                  const SizedBox(height: 25),
                  const Align(
                    alignment: Alignment.center,
                    child: ColorPlaceHolder(
                      width: 180,
                      height: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.center,
                    child: ColorPlaceHolder(
                      width: 190,
                      height: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: ColorPlaceHolder(
                      width: 130,
                      height: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '信息',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      letterSpacing: -0.8,
                      fontWeight: FontWeight.w500,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ColorPlaceHolder(
                height: 100,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '简介',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                      letterSpacing: -0.8,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    indent: 0,
                    endIndent: 0,
                    color: primaryColor,
                  ),
                  const ColorPlaceHolder(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}