import 'package:equatable/equatable.dart';

class CreatorComicsItem extends Equatable {
    final String? resourceUri;
    final String? name;

    const CreatorComicsItem({
      this.resourceUri,
      this.name,
    });

    @override
    List<Object?> get props => [
      resourceUri,
      name,
    ];
}
