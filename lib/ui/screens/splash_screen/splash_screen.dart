import 'dart:io';

import 'package:app_marvel/ui/screens/home_screen/home_screen.dart';
import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/utils/constants/asstes.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  navigateTo({required BuildContext context, required WidgetRef ref}){
    Future.delayed(
      const Duration(milliseconds: 200), 
      (){
        ref.read(getComicsUpdateNotifier.notifier).getComics(page: '1').then((value) {
          ref.read(loadInitialDataProvider.notifier).update((state) => false);
          ref.read(loadInitialDataProvider.notifier).state = false;
          ref.read(listComicProvider.notifier).state = ref.read(getComicsUpdateNotifier).data!.data!.results!;
            Navigator.pushAndRemoveUntil(
              context, 
              HomeScreen.goTo(), 
              (route) => false
            );
          }
        );
      }
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    navigateTo(context: context, ref: ref);
    return  Scaffold(
      backgroundColor: kBlack,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.3,
                    left: kDimens16,
                    right: kDimens16,
                  ),
                  child: Image.asset(kAssetMarvelGif),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.3,
                    left: kDimens16,
                    right: kDimens16
                  ),
                  child: Center(
                    child: Center(child: Platform.isAndroid 
                      ? const CircularProgressIndicator(color: kWhite) 
                      : const CupertinoActivityIndicator(color: kWhite,)
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: kDimens10,
                    left: kDimens16,
                    right: kDimens16,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Data provided by Marvel. © 2023 MARVEL",
                          style: TextStyle(
                            color: kWhite,
                            fontSize: kDimens12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Copyright © 2023 MARVEL",
                          style: TextStyle(
                            color: kWhite,
                            fontSize: kDimens12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ) ,
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}