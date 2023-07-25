import 'package:app_marvel/core/entities/comic_result.dart';
import 'package:app_marvel/core/models/price_model.dart';
import 'package:app_marvel/core/models/stories_model/stories_data_model.dart';
import 'package:app_marvel/core/models/thumbnail_model.dart';
import 'package:equatable/equatable.dart';

class ComicResultModel extends Equatable  {
  
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
    final ThumbnailModel? thumbnail;
    final List<PriceComicModel>? prices;
    final List<ThumbnailModel>? images;
    final StoriesDataModel? stories;

  const ComicResultModel({
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
    this.stories,
  });

  factory ComicResultModel.fromJson(Map<String, dynamic>json){
    return ComicResultModel(
      id: json['id'],
      digitalId: json['digitalId'],
      title: json['title'],
      issueNumber: json['issueNumber'],
      variantDescription: json['variantDescription'],
      description: json['description'],
      modified: json['modified'],
      isbn: json['isbn'],
      upc: json['upc'],
      ean: json['ean'],
      issn: json['issn'],
      pageCount: json['pageCount'],
      resourceUri: json['resourceUri'],
      thumbnail: ThumbnailModel.fromJson(json['thumbnail']),
      prices: (json['prices'] as List).map((e) => PriceComicModel.fromJson(e)).toList(),
      images: (json['images'] as List).map((e) => ThumbnailModel.fromJson(e)).toList(),
      stories: StoriesDataModel.fromJson(json['stories'])
    );
  }
  
  ComicResult toEntity()
    =>ComicResult(
      id:id,
      digitalId:digitalId,
      title:title,
      issueNumber:issueNumber,
      variantDescription:variantDescription,
      description:description,
      modified:modified,
      isbn:isbn,
      upc:upc,
      ean:ean,
      issn:issn,
      pageCount:pageCount,
      resourceUri:resourceUri,
      thumbnail:thumbnail?.toEntity(),
      prices: prices?.map((e) => e.toEntity()).toList(),
      images:images?.map((e) => e.toEntity()).toList(),
      stories: stories?.toEntity(),
    );

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
  ];


}