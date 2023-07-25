import 'dart:io';

import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final String? tag;
  const CustomImage({
    super.key, 
    this.path, 
    this.width, 
    this.height,
    this.tag
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? kEmptyString,
      child: CachedNetworkImage(
        imageUrl: path!,
        placeholder: (context, url) => Center(child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}