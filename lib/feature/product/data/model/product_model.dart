
import 'package:product/feature/product/domain/entities/product_entity.dart';

class ProductModel extends Product{

  
  const ProductModel({  super.id, super.title,super.category,super.price,super.desc,super.imageUrl});


  factory ProductModel.fromJson(Map<String, dynamic> json) {
    
    
    return ProductModel(
      id: json['_id'],
      title: json['name'],
      category: json['category'] ?? '',
      price: json['price'] ?? '',
      desc: json['description'] ?? '',
      imageUrl: json['image']
      
      
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id':id,
      
   
    };
  }



}