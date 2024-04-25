
import 'package:product/feature/product/domain/entities/product_entity.dart';

class ProductModel extends Product{

  
  const ProductModel({  super.id, super.title,super.category,super.price,super.desc,super.imageUrl});


   factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      price: json['price'] != null ? double.parse(json['price'].toString()) : null,
      desc: json['desc'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'desc': desc,
      'imageUrl': imageUrl,
    };
  }
}



