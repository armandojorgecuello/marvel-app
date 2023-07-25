import 'package:app_marvel/core/entities/creators/creator_comic_data.dart';
import 'package:app_marvel/core/models/creators_model/comic_item_model.dart';
import 'package:equatable/equatable.dart';

class CreatorComicDataModel extends Equatable {
    final int? available;
    final String? collectionUri;
    final int? returned;
    final List<CreatorComicsItemModel>? items;

    const CreatorComicDataModel({
      this.available,
      this.collectionUri,
      this.items,
      this.returned,
    });

    factory CreatorComicDataModel.fromJson(Map<String, dynamic> json) => CreatorComicDataModel(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] != null ? List<CreatorComicsItemModel>.from(json["items"].map((x) => CreatorComicsItemModel.fromJson(x))) : [],
        returned: json["returned"],
    );

    CreatorComicData toEntity()
      =>CreatorComicData(
        available: available,
        collectionUri: collectionUri,
        items: items,
        returned: returned,
      );

    @override
    List<Object?> get props => [
      available,
      collectionUri,
      items,
      returned,
    ];
}

