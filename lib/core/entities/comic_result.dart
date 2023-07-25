import 'package:app_marvel/core/entities/price.dart';
import 'package:app_marvel/core/entities/stories/stories_data.dart';
import 'package:app_marvel/core/entities/thumbnail.dart';
import 'package:equatable/equatable.dart';

class ComicResult extends Equatable  {
  
    final int? id;
    final int? digitalId;
    final String? title;
    final int? issueNumber;
    final String? variantDescription;
    final String? description;
    final String? modified;
    final String? isbn;
    final String? upc;
    final String? ean;
    final String? issn;
    final int? pageCount;
    final String? resourceUri;
    final Thumbnail? thumbnail;
    final List<PriceComic>? prices;
    final List<Thumbnail>? images;
    final StoriesData? stories;

  const ComicResult({
    this.id, 
    this.digitalId, 
    this.title, 
    this.issueNumber, 
    this.variantDescription, 
    this.description, 
    this.modified, 
    this.isbn, 
    this.upc, 
    this.ean, 
    this.issn, 
    this.pageCount, 
    this.resourceUri, 
    this.thumbnail,
    this.prices, 
    this.images,
    this.stories
  });

  @override
  List<Object?> get props => [
    id,
    digitalId,
    title,
    issueNumber,
    variantDescription,
    description,
    modified,
    isbn,
    upc,
    ean,
    issn,
    pageCount,
    resourceUri,
    thumbnail,
    prices,
    images,
    stories
  ];


}