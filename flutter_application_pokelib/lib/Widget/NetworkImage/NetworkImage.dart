// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  String source;
  double? width;
  double? height;
  BoxFit fit;
  NetworkImageWidget(
      {required this.source,
      Key? key,
      this.width,
      this.height,
      this.fit = BoxFit.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: source,
      fit: fit,
      placeholder: (context, url) => Image.asset("lib/Asset/loading_pok2.gif"),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
