import 'package:app_marvel/core/entities/comic_result.dart';
import 'package:equatable/equatable.dart';

class ComicData extends Equatable {
  
    final int? offset;
    final int? limit;
    final int? total;
    final int? count;
    final List<ComicResult>? results;

  const ComicData({
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