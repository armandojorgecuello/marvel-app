import 'dart:async';
import 'dart:io';

import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/screens/home_screen/widgets/error_home_widget.dart';
import 'package:app_marvel/ui/screens/home_screen/widgets/home_comics_list.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:app_marvel/ui/screens/home_screen/widgets/custom_filter_widget.dart';
import 'package:app_marvel/ui/screens/home_screen/widgets/custom_search_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
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
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  ScrollController scrollController = ScrollController();
  int page = 1;

  Future _fetchData({required String page, String? filterSelected, String? query})async{
    return ref.read(getComicsUpdateNotifier.notifier).getComics(
      page: page,
      filterSelected: filterSelected,
      query: query
    );
  }

  @override
  void initState() {
    scrollController.addListener(scrollLister);
    super.initState();
  }

  void scrollLister(){
    final isLoading = ref.watch(getComicsUpdateNotifier).isLoading;
    if(scrollController.position.pixels >= scrollController.position.minScrollExtent - 500){
      ref.read(showButtonProvider.notifier).update((state) => true);
    }
    if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500 && !isLoading ){  
      _fetchData(
        page: page.toString(),
        filterSelected: ref.watch(filterSelectedProvider).isNotEmpty ? ref.watch(filterSelectedProvider) : null,
        query: ref.watch(queryProvider).isNotEmpty ? ref.watch(queryProvider) : null,
      ).then((value) {
        if (ref.read(getComicsUpdateNotifier).data != null){
          page++;
          ref.read(listComicProvider.notifier).update((state) {
            state.insertAll(state.length, ref.read(getComicsUpdateNotifier).data!.data!.results!);
            state.addAll(ref.read(getComicsUpdateNotifier).data!.data!.results!);
            return state;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context,) {
    final comicsData = ref.watch(listComicProvider);
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButton: 
        ref.watch(showButtonProvider) ?
          FloatingActionButton(
            onPressed: (){
              scrollController.animateTo(
                scrollController.position.minScrollExtent, 
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut
              ).then((value) {
                ref.read(showButtonProvider.notifier).update((state) => false);
              });
            },
            backgroundColor: kBlack,
            child: const Icon(
              Icons.arrow_upward,
              color: kWhite,
              size: kDimens30,
            ),
          ) 
          : null,
      appBar: AppBar(
        elevation: kDimens0,
        backgroundColor: kWhite,
        centerTitle: true,
        title: Text(
          I18n.of(context).sHomehScreenTitle,
          style: const TextStyle(
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
            controller: scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const CustomSearchBarItem(),
                    const SizedBox(height: kDimens16,),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDimens5,
                          vertical: kDimens5,
                        ),
                        child: Text(
                          I18n.of(context).sHomehScreenFilterBy,
                          style: const TextStyle(
                            color: kBlack,
                            fontSize: kDimens18
                          ),
                        ),
                      ),
                    ),
                    const CustomFiltersWidget(),
                    const SizedBox( height: kDimens10,),
                  ]
                )
              ),
              !ref.watch(loadInitialDataProvider) && comicsData.isNotEmpty
              ? HomeComicsList(comicsData: comicsData)
                : ref.watch(getComicsUpdateNotifier).error != null 
                ? const SliverToBoxAdapter(
                  child: HomeErrorWidget()
                ) 
              : SliverToBoxAdapter(
                child: Center(
                  child: Platform.isAndroid 
                    ? const CircularProgressIndicator() 
                    : const CupertinoActivityIndicator()
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

