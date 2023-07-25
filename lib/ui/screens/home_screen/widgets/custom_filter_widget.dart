import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFiltersWidget extends ConsumerWidget {
  const CustomFiltersWidget({
    super.key,
  });

  Future _fetchData({required String page, String? filterSelected, required WidgetRef ref})async{
    return ref.read(getComicsUpdateNotifier.notifier).getComics(
      page: page,
      filterSelected: filterSelected,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 3,
      direction: Axis.horizontal,
      children: kComicFormatSelect.map((e) 
        => FilterChip(
          label: Text(
            e
          ),
          labelStyle: const TextStyle(color: kBlack,fontSize: kDimens12),
          selected: e == ref.watch(filterSelectedProvider),
          onSelected: (bool value) {
            ref.read(loadInitialDataProvider.notifier).update((state) => true);
            if(e == ref.watch(filterSelectedProvider)){
              _fetchData(page: '0', ref: ref, filterSelected: null).then(( _ ) {
                if (ref.read(getComicsUpdateNotifier).data != null){
                  ref.read(listComicProvider.notifier).state = ref.read(getComicsUpdateNotifier).data!.data!.results!;
                  ref.read(filterSelectedProvider.notifier).update((state) => kEmptyString);
                  ref.read(loadInitialDataProvider.notifier).update((state) => false);
                }
              });
            }else{
              _fetchData(page: '0', ref: ref, filterSelected: e).then(( _ ) {
                if (ref.read(getComicsUpdateNotifier).data != null){
                  ref.read(listComicProvider.notifier).state = ref.read(getComicsUpdateNotifier).data!.data!.results!;
                  ref.read(filterSelectedProvider.notifier).update((state) => e);
                  ref.read(loadInitialDataProvider.notifier).update((state) => false);
                }
              });
            }
          },
        )
      ).toList(),
    );
  }
}

