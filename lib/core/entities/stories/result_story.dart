import 'package:equatable/equatable.dart';

class ResultStory  extends Equatable{
    final String? resourceURI;
    final String? name;
    final String? type;

    const ResultStory({
      this.resourceURI,
      this.name,
      this.type,
    });

    @override
    List<Object?> get props => [
      name,
      resourceURI,
      type,
    ];

}