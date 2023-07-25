import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/ui/screens/details_screen/details_screen.dart';
import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:app_marvel/ui/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeComicsList extends ConsumerWidget {
  const HomeComicsList({
    super.key,
    required this.comicsData,
  });

  final List<ComicResult> comicsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList.builder(
      itemCount: comicsData.length,
      itemBuilder: (BuildContext context, int index) { 
        final data = comicsData[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: kDimens16),
          child: GestureDetector(
            onTap: (){
              ref.read(getComicsCreatorUpdateNotifier.notifier).getComicsCretors(
                comicId: data.id.toString()
              ).then((value) {
                if(ref.read(getComicsCreatorUpdateNotifier).data != null){
                  Navigator.push(
                    context, 
                    DetailScreen.goTo(data)
                  );
                }else{
                  
                }
              });
            },
            child: Column(
              children: [
                Text(
                  data.title ?? kEmptyString,
                  style: const TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: kDimens16
                  ),
                ),
                const SizedBox(height: kDimens5,),
                Card(
                  elevation: kDimens6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDimens16)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kDimens16),
                    child: CustomImage(
                      tag: '${data.thumbnail!.path}.${data.thumbnail!.extension}',
                      height: MediaQuery.of(context).size.height*0.5,
                      width: MediaQuery.of(context).size.width,
                      path: '${data.thumbnail!.path}.${data.thumbnail!.extension}' , 
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

