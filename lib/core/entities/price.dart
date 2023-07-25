import 'package:equatable/equatable.dart';

class PriceComic  extends Equatable{
  
  final String?  type;
  final double? price;

  const PriceComic({
    this.type, 
    this.price
  });

  

  @override
  List<Object?> get props => [
    type,
    price,
  ];

}