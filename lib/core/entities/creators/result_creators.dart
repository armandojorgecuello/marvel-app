import 'package:app_marvel/core/entities/creators/creator_result_data.dart';
import 'package:equatable/equatable.dart';

class ResultCreators extends Equatable{
    final int? offset;
    final int? limit;
    final int? total;
    final int? count;
    final List<CreatorResultData>? results;

    const ResultCreators({
      this.offset,
      this.limit,
      this.total,
      this.count,
      this.results,
    });

    @override
    List<Object?> get props => [
      offset,
      limit,
      total,
      count,
      results,
    ];

}

