import 'dart:io';

import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/entities/creators/creator_result_data.dart';
import 'package:app_marvel/ui/screens/creator_details_screen/creator_details_screen.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatorsListWidget extends StatelessWidget {
  const CreatorsListWidget({
    super.key,
    required this.creators,
  });

  final CreatorComics creators;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: creators.data!.results!.length,
      itemBuilder: (BuildContext context, int index) {
        final data = creators.data!.results![index];
        return GestureDetector(
          onTap: () => onPressed(context: context, data:data ),
          child: Padding(
            padding: const EdgeInsets.only(left: kDimens16,right: kDimens16, bottom: kDimens10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDimens5),
                  child: CachedNetworkImage(
                    imageUrl: '${data.thumbnail!.path!}.${data.thumbnail!.extension!}',
                    placeholder: (context, url) => Center(child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    height: kDimens50,
                    width: kDimens50,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: kDimens10,
                    bottom: kDimens5,
                    left: kDimens5
                  ),
                  child: Column(
                    children: [
                      Text(
                        data.fullName ?? kEmptyString,
                        style: const TextStyle(
                          color: kBlack,
                          fontSize: kDimens14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => onPressed(context: context, data:data ), 
                  icon: const Icon(Icons.arrow_forward_ios, color: kBlack, size: kDimens25, )
                )
              ],
            ),
          ),
        );
      },
    );
  }

  onPressed({required BuildContext context, required CreatorResultData data }){
    Navigator.push(
      context, 
      CreatorDetailScreen.goTo(
        data: data
      )
    );
  }

}

