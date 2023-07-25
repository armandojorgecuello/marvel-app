import 'package:app_marvel/core/entities/creators/result_creators.dart';
import 'package:equatable/equatable.dart';

class CreatorComics extends Equatable {
    final int? code;
    final String? status;
    final String? copyright;
    final String? attributionText;
    final String? attributionHtml;
    final String? etag;
    final ResultCreators? data;

    const CreatorComics({
      this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHtml,
      this.etag,
      this.data,
    });
    
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

