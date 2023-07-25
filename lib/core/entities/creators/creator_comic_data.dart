import 'package:app_marvel/core/models/creators_model/comic_item_model.dart';
import 'package:equatable/equatable.dart';

class CreatorComicData extends Equatable {
    final int? available;
    final String? collectionUri;
    final int? returned;
    final List<CreatorComicsItemModel>? items;

    const CreatorComicData({
      this.available,
      this.collectionUri,
      this.items,
      this.returned,
    });

    @override
    List<Object?> get props => [
      available,
      collectionUri,
      items,
      returned,
    ];
}

