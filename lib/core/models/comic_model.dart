import 'package:app_marvel/core/entities/comic.dart';
import 'package:app_marvel/core/models/comic_data_model.dart';
import 'package:equatable/equatable.dart';

class ComicModel extends Equatable{

  final int? code;
  final String? status;
  final ComicDataModel? data;

  const ComicModel({
    this.code, 
    this.status, 
    this.data
  });

  factory ComicModel.fromJson(Map<String, dynamic> json){
    return ComicModel(
      code: json['code'],
      status: json['status'],
      data: ComicDataModel.fromJson(json['data']),
    );
  }
  
  Comic toEntity()
    => Comic(
      code:code,
      status:status,
      data:data?.toEntity(),
    );

  @override
  List<Object?> get props => [
    code,
    status,
    data,
  ];


}