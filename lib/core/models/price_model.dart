import 'package:app_marvel/core/entities/price.dart';
import 'package:equatable/equatable.dart';

class PriceComicModel  extends Equatable{
  
  final String?  type;
  final double? price;

  const PriceComicModel({
    this.type, 
    this.price
  });

  factory PriceComicModel.fromJson(Map<String, dynamic> json){
    return PriceComicModel(
      type: json['type'] ,
      price: (json['price'] as num).toDouble() ,
    );
  }
  
  PriceComic toEntity()
    =>PriceComic(
      type :type,
      price : price,
    );

  @override
  List<Object?> get props => [
    type,
    price,
  ];

}