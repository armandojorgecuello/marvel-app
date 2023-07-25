import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomDescriptionWidget extends StatelessWidget {
  const CustomDescriptionWidget({
    super.key,
    required this.comicData,
  });

  final ComicResult comicData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDimens16, vertical: kDimens16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            I18n.of(context).sDescriptionScreenDescription,
            style: const TextStyle(
              color: kBlack,
              fontWeight: FontWeight.bold,
              fontSize: kDimens20
            ),
          ),
          const SizedBox(height: kDimens10,),
          Text(
            comicData.description!= null 
              ? comicData.description!.isNotEmpty 
                ? comicData.description!   
                : I18n.of(context).sDescriptionScreenNoDescription 
              : I18n.of(context).sDescriptionScreenNoDescription,
            style: const TextStyle(
              color: Colors.black, 
              fontSize: kDimens15,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}

