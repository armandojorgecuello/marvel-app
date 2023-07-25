import 'package:app_marvel/core/entities/comic_data.dart';
import 'package:equatable/equatable.dart';

class Comic extends Equatable{

  final int? code;
  final String? status;
  final ComicData? data;

  const Comic({
    this.code, 
    this.status, 
    this.data
  });

  @override
  List<Object?> get props => [
    code,
    status,
    data,
  ];


}