import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/models/creators_model/result_creators_model.dart';
import 'package:equatable/equatable.dart';

class CreatorComicsModel extends Equatable {
    final int? code;
    final String? status;
    final String? copyright;
    final String? attributionText;
    final String? attributionHtml;
    final String? etag;
    final ResultCreatorsModel? data;

    const CreatorComicsModel({
      this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHtml,
      this.etag,
      this.data,
    });

    factory CreatorComicsModel.fromJson(Map<String, dynamic> json) => CreatorComicsModel(
      code: json["code"],
      status: json["status"],
      copyright: json["copyright"],
      attributionText: json["attributionText"],
      attributionHtml: json["attributionHTML"],
      etag: json["etag"],
      data: ResultCreatorsModel.fromJson(json["data"]),
    );
    
    CreatorComics toEntity()
      =>CreatorComics(
        code:code,
        status:status,
        copyright:copyright,
        attributionText:attributionText,
        attributionHtml:attributionHtml,
        etag:etag,
        data:data?.toEntity(),
      );

    @override
    List<Object?> get props => [
      code,
      status,
      copyright,
      attributionText,
      attributionHtml,
      etag,
      data,
    ];
}

