import 'package:app_marvel/core/entities/thumbnail.dart';
import 'package:equatable/equatable.dart';

class ThumbnailModel extends Equatable {
  
  final String? path;
  final String? extension;

  const ThumbnailModel({
    this.path, 
    this.extension
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json){
    return ThumbnailModel(
      path: json['path'],
      extension: json['extension']
    );
  }

  Thumbnail toEntity(){
    return Thumbnail(
      extension: extension,
      path: path,
    );
  }
  
  @override
  List<Object?> get props => [
    path,
    extension,
  ];

}