import 'dart:io';

import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/generated/l10n.dart';
import 'package:app_marvel/ui/screens/details_screen/widgets/creator_list_widget.dart';
import 'package:app_marvel/ui/screens/details_screen/widgets/custom_carrousel_sliver.dart';
import 'package:app_marvel/ui/screens/details_screen/widgets/custom_description_widget.dart';
import 'package:app_marvel/ui/screens/details_screen/widgets/price_item_widget.dart';
import 'package:app_marvel/ui/screens/details_screen/widgets/stories_list_widget.dart';
import 'package:app_marvel/ui/screens/home_screen/logic/home_screen_provider.dart';
import 'package:app_marvel/ui/utils/constants/constants.dart';
import 'package:app_marvel/ui/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
    required this.comicData,
  });

  final ComicResult comicData;

  static Route goTo(ComicResult comicData){
    return MaterialPageRoute(
      builder: ( _ ) => DetailScreen(
        comicData: comicData,
      ),
      settings: const RouteSettings(
        name: kDetailsScreen
      )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creators = ref.watch(getComicsCreatorUpdateNotifier).data as CreatorComics;
    return Scaffold(
      backgroundColor: kWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kWhite,
            elevation: kDimens0,
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height*0.4,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft:Radius.circular(kDimens30) ,
                  bottomRight:Radius.circular(kDimens30) ,
                ),
                child: CustomImage(
                  tag:'${comicData.thumbnail!.path}.${comicData.thumbnail!.extension}',
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  path: '${comicData.thumbnail!.path}.${comicData.thumbnail!.extension}', 
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: kDimens16),
              child: FloatingActionButton(
                backgroundColor: kWhite,
                child: Icon( Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios, color: Colors.black,),
                onPressed: (){
                  Navigator.pop(context);
                }
              ),
            ) 
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: kDimens16,),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDimens16),
              child: Text(
                comicData.title ?? kEmptyString,
                style: const TextStyle(
                  color: kBlack,
                  fontSize: kDimens20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PriceItemWidget(comicData: comicData),
          ),
          SliverToBoxAdapter(
            child: CustomDescriptionWidget(comicData: comicData),
          ),
          comicData.stories!.items!.isNotEmpty 
          ? SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDimens16),
              child: Text(
                I18n.of(context).sDescriptionScreenComicStories,
                style: const TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: kDimens20
                ),
              ),
            ),
          )
          : const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ),
          comicData.stories!.items!.isNotEmpty
            ?  StoriesListWidget(comicData: comicData) 
            : const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            ),
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: CustomCarrouselSliver(comicData: comicData)
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(),
          ),
          creators.data!.results!.isNotEmpty 
          ? SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: kDimens16, bottom: kDimens16, right: kDimens16),
              child: Text(
                I18n.of(context).sDescriptionScreenComicCreators,
                style: const TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: kDimens20
                ),
              ),
            ),
          )
          : const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ),
          creators.data!.results!.isNotEmpty
          ?  CreatorsListWidget(creators: creators)
          : const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kDimens30,
            ),
          )
        ],
      ),
    );
  }
}

