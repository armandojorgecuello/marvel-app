import 'package:app_marvel/core/entities/stories/stories_data.dart';
import 'package:app_marvel/core/models/stories_model/result_story_model.dart';
import 'package:equatable/equatable.dart';

class StoriesDataModel extends Equatable{
    final int? available;
    final String? collectionURI;
    final int? returned;
    final List<ResultStoryModel>? items;

    const StoriesDataModel({
        this.available,
        this.collectionURI,
        this.returned,
        this.items,
    });

    factory StoriesDataModel.fromJson(Map<String, dynamic> json) => StoriesDataModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      returned: json['returned'],
      items: json['items'] != null ? (json['items'] as List ).map((e) => ResultStoryModel.fromJson(e)).toList() : [],
    );
    
    StoriesData toEntity()
      =>StoriesData(
        available: available,
        collectionURI: collectionURI,
        items: items?.map((e) => e.toEntity()).toList(),
        returned: returned
      );

    @override
    List<Object?> get props =>[
      available,
      collectionURI,
      returned,
      items,
    ];

}
