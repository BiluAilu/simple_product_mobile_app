import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? title;
  final String? category;
  final double? price;
  final String? desc;
  final String? imageUrl;



  const Product(
      {
        this.id ,
        this.title,
        required this.category,
      required this.price,
      this.desc = "",
      this.imageUrl
      });
      

      
 @override
 List<Object?> get props => [id,title,category, price];


}
