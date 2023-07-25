
import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
  
  final String? path;
  final String? extension;

  const Thumbnail({
    this.path, 
    this.extension
  });

  @override
  List<Object?> get props => [
    path,
    extension,
  ];

}