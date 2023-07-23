import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:app_marvel/ui/widgets/custom_search_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static Route goTo(){
    return MaterialPageRoute(
      builder: ( _ ) => const HomeScreen(),
      settings: const RouteSettings(
        name: kHomeScreen
      )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: kDimens0,
        backgroundColor: kWhite,
        centerTitle: true,
        title: const Text(
          'Marvel App',
          style: TextStyle(
            color: kBlack,
            fontSize: kDimens30,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDimens16),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const CustomSearchBarItem(),
                    const SizedBox(height: kDimens16,),
                    Wrap(
                      spacing: 3,
                      direction: Axis.horizontal,
                      children: kComicFormatSelect.map((e) 
                        => FilterChip(
                          label: Text(
                            e
                          ),
                          labelStyle: const TextStyle(color: kBlack,fontSize: kDimens16),
                          selected: e == ref.watch(filterSelectedProvider),
                          onSelected: (bool value) {
                            if(e == ref.watch(filterSelectedProvider)){
                              ref.read(filterSelectedProvider.notifier).update((state) =>  state = '');
                            }else{
                              ref.read(filterSelectedProvider.notifier).update((state) =>  state = e);
                            }
                          },
                        )
                      ).toList(),
                    ),
                  ]
                )
              )
            ],
          ),
        )
      ),
    );
  }
}

