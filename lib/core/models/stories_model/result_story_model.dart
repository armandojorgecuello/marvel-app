import 'package:app_marvel/core/entities/stories/result_story.dart';
import 'package:equatable/equatable.dart';

class ResultStoryModel  extends Equatable{
    final String? resourceURI;
    final String? name;
    final String? type;

    const ResultStoryModel({
      this.resourceURI,
      this.name,
      this.type,
    });

    factory ResultStoryModel.fromJson(Map<String, dynamic> json) => ResultStoryModel(
        resourceURI: json['resourceURI'],
        name: json["name"],
        type: json['type']
    );

    ResultStory toEntity()
      => ResultStory(
        name: name,
        resourceURI: resourceURI,
        type: type,
      );


      @override
      List<Object?> get props => [
        name,
        resourceURI,
        type,
      ];

}