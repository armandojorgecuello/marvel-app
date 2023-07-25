import 'package:app_marvel/core/entities/creators/creator_comic_data.dart';
import 'package:app_marvel/core/entities/thumbnail.dart';
import 'package:equatable/equatable.dart';

class CreatorResultData extends Equatable{
    final int? id;
    final String? firstName;
    final String? middleName;
    final String? lastName;
    final String? suffix;
    final String? fullName;
    final String? modified;
    final Thumbnail? thumbnail;
    final String? resourceUri;
    final CreatorComicData? comics;


    const CreatorResultData({
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

