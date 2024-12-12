import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../style/ui_const.dart';
import '../placeholder.dart';

Widget getCustomCachedImage({
  required String url,
  double? width,
  double? height,
}){
  return CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    width: width,
    height: height,
    placeholder: (context, url) => Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const ColorPlaceHolder(
        width: 190,
        height: 40,
      ),
    ),
    fadeInDuration: const Duration(milliseconds: 150),
    fadeOutDuration: const Duration(milliseconds: 150),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

Widget getCustomFadeInImage({
  required String url,
  double? width,
  double? height,
}){
  return FadeInImage.assetNetwork(
    fadeInDuration: const Duration(milliseconds: 150),
    fadeOutDuration: const Duration(milliseconds: 150),
    placeholder: UiConst.defImageHolder,
    image: url,
    fit: BoxFit.cover,
    width: width,
    height: height,
  );
}