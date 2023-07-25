import 'dart:io';

import 'package:app_marvel/core/entities/creators/creator_result_data.dart';
import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatorDetailScreen extends ConsumerWidget {
  const CreatorDetailScreen({
    super.key,
    required this.data,
  });

  final CreatorResultData data;

  static Route goTo({required CreatorResultData data}){
    return MaterialPageRoute(
      builder: ( _ ) =>  CreatorDetailScreen(
        data: data,
      ),
      settings: const RouteSettings(
        name: kCreatorDetailScreen
      )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: kDimens0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon( Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios, color: Colors.black,)
        ),
        title: Text(
          data.fullName ?? kEmptyString,
          style: const TextStyle(
            color: kBlack,
            fontSize: kDimens20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: kDimens20,),
                CircleAvatar(
                  radius: kDimens70,
                  backgroundImage: NetworkImage(
                    '${data.thumbnail!.path!}.${data.thumbnail!.extension!}'
                  ),
                ),
                const SizedBox(height: kDimens16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDimens16),
                  child: Text(
                    I18n.of(context).sCreatorDescriptionScreenInfo,
                    style: const TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: kDimens20
                    ),
                  ),
                ),
                const SizedBox(height: kDimens16,),
                ...data.comics!.items!.map((e) 
                  => Padding(
                    padding: const EdgeInsets.only(left: kDimens16,right: kDimens16, bottom: kDimens10),
                    child: Text(
                      e.name ?? kEmptyString,
                      style: const TextStyle(
                        color: kBlack,
                        fontSize: kDimens16
                      ),
                    ),
                  )
                ).toList(),
                const SizedBox(height: kDimens30,),
              ]
            )
          )
        ],
      ),
    );
  }
}