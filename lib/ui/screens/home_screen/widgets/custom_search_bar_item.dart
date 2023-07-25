import 'dart:async';

import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBarItem extends ConsumerStatefulWidget {
  const CustomSearchBarItem({
    super.key,
  });

  @override
  ConsumerState<CustomSearchBarItem> createState() => _CustomSearchBarItemState();
}

class _CustomSearchBarItemState extends ConsumerState<CustomSearchBarItem> {

  TextEditingController textEditingController = TextEditingController();
  Timer? timer;
  String? querySearch;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future _fetchData({required String page, String? query})async{
    return ref.read(getComicsUpdateNotifier.notifier).getComics(
      page: page,
      query: query
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shadowColor: MaterialStateProperty.all(kGrey),
      backgroundColor: MaterialStateProperty.all(kGrey),
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: kDimens10),
        child: Icon(Icons.search),
      ),
      onChanged: (value){
        if (timer != null) {
          timer?.cancel();
        }
        if(value.isEmpty){
          _fetchData(
            page: '0',
          ).then(( _ ) {
            if (ref.read(getComicsUpdateNotifier).data != null){
              ref.read(queryProvider.notifier).update((state) => value);
              ref.read(listComicProvider.notifier).state = ref.read(getComicsUpdateNotifier).data!.data!.results!;
            }
          });
        }
        timer = Timer(const Duration(milliseconds: 200), () {
          _fetchData(
            page: '0',
            query: value
          ).then(( _ ) {
            if (ref.read(getComicsUpdateNotifier).data != null){
              ref.read(queryProvider.notifier).update((state) => kEmptyString);
              ref.read(listComicProvider.notifier).state = ref.read(getComicsUpdateNotifier).data!.data!.results!;
            }
          });
        });
      },
      controller: textEditingController,
      trailing: [
        GestureDetector(
          onTap: (){
             setState(() {
                textEditingController.clear();
              });
              ref.read(loadInitialDataProvider.notifier).update((state) => true);
              _fetchData(
              page: '0',
            ).then(( _ ) {
              if (ref.read(getComicsUpdateNotifier).data != null){
                ref.read(listComicProvider.notifier).state = ref.read(getComicsUpdateNotifier).data!.data!.results!;
                ref.read(loadInitialDataProvider.notifier).update((state) => false);
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDimens10),
            child: GestureDetector(
              child: const Icon(Icons.close, color: kWhite, size: kDimens16,),
            ),
          ),
        ),
      ],
      
    );
  }
}