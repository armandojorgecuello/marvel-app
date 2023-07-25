import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          I18n.of(context).sHomehScreenNoInformationAvailable,
          style: const TextStyle(
            color: kBlack,
            fontSize: kDimens18,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

