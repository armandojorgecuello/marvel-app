import 'package:app_marvel/core/entities/stories/result_story.dart';
import 'package:equatable/equatable.dart';

class StoriesData extends Equatable{
    final int? available;
    final String? collectionURI;
    final int? returned;
    final List<ResultStory>? items;

    const StoriesData({
        this.available,
        this.collectionURI,
        this.returned,
        this.items,
    });

      @override
      List<Object?> get props =>[
        available,
        collectionURI,
        returned,
        items,
      ];

}
