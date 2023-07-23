import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBarItem extends StatelessWidget {
  const CustomSearchBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shadowColor: MaterialStateProperty.all(kGrey),
      backgroundColor: MaterialStateProperty.all(kGrey),
      leading: const Icon(Icons.search),
      trailing: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDimens10),
          child: GestureDetector(
            child: const Icon(Icons.close, color: kWhite, size: kDimens16,),
          ),
        ),
      ],
      
    );
  }
}