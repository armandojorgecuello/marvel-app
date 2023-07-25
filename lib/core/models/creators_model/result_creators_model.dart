import 'package:app_marvel/core/entities/creators/result_creators.dart';
import 'package:app_marvel/core/models/creators_model/creator_result_data_model.dart';
import 'package:equatable/equatable.dart';

class ResultCreatorsModel extends Equatable{
    final int? offset;
    final int? limit;
    final int? total;
    final int? count;
    final List<CreatorResultDataModel>? results;

    const ResultCreatorsModel({
      this.offset,
      this.limit,
      this.total,
      this.count,
      this.results,
    });

    factory ResultCreatorsModel.fromJson(Map<String, dynamic> json) => ResultCreatorsModel(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<CreatorResultDataModel>.from(json["results"].map((x) => CreatorResultDataModel.fromJson(x))),
    );
    
    ResultCreators toEntity()
      =>ResultCreators(
        offset:offset,
        limit:limit,
        total:total,
        count:count,
        results:results?.map((e) => e.toEntity()).toList(),
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

