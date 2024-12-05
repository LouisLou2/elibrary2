import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../style/ui_const.dart';

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
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
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