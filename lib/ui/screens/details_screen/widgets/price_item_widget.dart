import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class PriceItemWidget extends StatelessWidget {
  const PriceItemWidget({
    super.key,
    required this.comicData,
  });

  final ComicResult comicData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDimens16),
      child: Column(
        children: (comicData.prices ?? []).map((e) 
        => Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Text(
                e.type!.contains('print') ? '${I18n.of(context).sDescriptionScreenPrintPrice} : \$' : '${I18n.of(context).sDescriptionScreenDigitalPurchasePrice} : \$',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),  
              ),
              Text(
                e.price!.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),  
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }
}

