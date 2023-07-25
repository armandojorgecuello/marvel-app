import 'package:app_marvel/core/entities/creators/creator_result_data.dart';
import 'package:app_marvel/core/models/creators_model/creator_comic_data_model.dart';
import 'package:app_marvel/core/models/models.dart';
import 'package:equatable/equatable.dart';

class CreatorResultDataModel extends Equatable{
    final int? id;
    final String? firstName;
    final String? middleName;
    final String? lastName;
    final String? suffix;
    final String? fullName;
    final String? modified;
    final ThumbnailModel? thumbnail;
    final String? resourceUri;
    final CreatorComicDataModel? comics;


    const CreatorResultDataModel({
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.suffix,
      this.fullName,
      this.modified,
      this.thumbnail,
      this.resourceUri,
      this.comics,
    });

    factory CreatorResultDataModel.fromJson(Map<String, dynamic> json) => CreatorResultDataModel(
      id: json["id"],
      firstName: json["firstName"],
      middleName: json["middleName"],
      lastName: json["lastName"],
      suffix: json["suffix"],
      fullName: json["fullName"],
      modified: json["modified"],
      thumbnail: ThumbnailModel.fromJson(json["thumbnail"]),
      resourceUri: json["resourceURI"],
      comics: CreatorComicDataModel.fromJson(json["comics"]),
    );

    CreatorResultData toEntity()
      =>CreatorResultData(
        id:id,
        firstName:firstName,
        middleName:middleName,
        lastName:lastName,
        suffix:suffix,
        fullName:fullName,
        modified:modified,
        thumbnail:thumbnail?.toEntity(),
        resourceUri:resourceUri,
        comics:comics?.toEntity(),
      );
    
    @override
    List<Object?> get props => [
      id,
      firstName,
      middleName,
      lastName,
      suffix,
      fullName,
      modified,
      thumbnail,
      resourceUri,
      comics,
    ];
}

