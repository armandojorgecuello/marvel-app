import 'package:app_marvel/core/entities/comic_data.dart';
import 'package:app_marvel/core/models/comic_result_model.dart';
import 'package:equatable/equatable.dart';

class ComicDataModel extends Equatable {
  
    final int? offset;
    final int? limit;
    final int? total;
    final int? count;
    final List<ComicResultModel>? results;

  const ComicDataModel({
    this.offset, 
    this.limit, 
    this.total, 
    this.count, 
    this.results,
  });
  
  factory ComicDataModel.fromJson(Map<String,dynamic>json){
    return ComicDataModel(
      offset:json['offset'],
      limit:json['limit'],
      total:json['total'],
      count:json['count'],
      results:(json['results'] as List).map((e) => ComicResultModel.fromJson(e)).toList(), 
    );
  }

  ComicData toEntity()
    =>ComicData(
      offset :offset,
      limit :limit,
      total :total,
      count :count,
      results :results?.map((e) => e.toEntity()).toList(),
    );
  
  @override
  List<Object?> get props => [
    offset,
    limit,
    total,
    count,
    results,
  ];

}