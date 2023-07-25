import 'dart:io';

import 'package:app_marvel/core/entities/entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCarrouselSliver extends StatelessWidget {
  const CustomCarrouselSliver({
    super.key,
    required this.comicData,
  });

  final ComicResult comicData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: (comicData.images ?? []).map((i) {
          final image = '${i.path}.${i.extension}';
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => Center(child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*.9,
                    fit: BoxFit.fill,
                  )
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}