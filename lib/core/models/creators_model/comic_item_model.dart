import 'package:equatable/equatable.dart';

class CreatorComicsItemModel extends Equatable {
    final String? resourceUri;
    final String? name;

    const CreatorComicsItemModel({
      this.resourceUri,
      this.name,
    });

    factory CreatorComicsItemModel.fromJson(Map<String, dynamic> json) => CreatorComicsItemModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );

    CreatorComicsItemModel toEntity()
      =>CreatorComicsItemModel(
        name: name,
        resourceUri: resourceUri
      );

    @override
    List<Object?> get props => [
      resourceUri,
      name,
    ];
}
