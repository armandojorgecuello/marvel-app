import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class StoriesListWidget extends StatelessWidget {
  const StoriesListWidget({
    super.key,
    required this.comicData,
  });

  final ComicResult comicData;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: comicData.stories!.items!.length,
      itemBuilder: (BuildContext context, int index) {
        final data = comicData.stories!.items![index];
        return Padding(
          padding: const EdgeInsets.only(
            top: kDimens10,
            bottom: kDimens5,
            left: kDimens17
          ),
          child: Text(
            data.name ?? kEmptyString,
            style: const TextStyle(
              color: kBlack,
              fontSize: kDimens14,
              fontWeight: FontWeight.normal
            ),
          ),
        );
      },
    );
  }
}

