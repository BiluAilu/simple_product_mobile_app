import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product/core/common_var.dart';
import 'package:product/core/error/exception.dart';
import 'package:product/feature/product/data/model/product_model.dart';
import 'package:product/feature/product/domain/entities/product_entity.dart';

abstract class RemoteProductDataSource {
  Future<List<Product>> getProducts();

  Future<ProductModel> insertProduct(      {required title,
      required String? category,
      required double? price,
      required String? desc,
      String? imageUrl});
  Future<Product> getProduct({required String id});
  Future<Product> updateProduct(
      {required id,
      required title,
      required String? category,
      required double? price,
      required String? desc,
      String? imageUrl});
  Future<bool> deleteProduct({required String id});


}

class RemoteProductDataSourceImp implements RemoteProductDataSource {
  late http.Client client;

  RemoteProductDataSourceImp({required this.client});

  @override
  Future<ProductModel> insertProduct(
      {required title,
      required String? category,
      required double? price,
      required String? desc,
      String? imageUrl}) async {
    String token = ""; // User token
    try {
      Map data;
      data = {
        'title': title,
        'description': desc,
        'price': price,
        'image': imageUrl,
        'category': category
      };
      var body = json.encode(data);
      final response = await client.post(
        Uri.parse(insertProductApiLink),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}"
        },
      );

      return ProductModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Product> getProduct({required String id}) async {
    String token = ""; // User token
    final response =
        await client.get(Uri.parse('$getProductApiLink/$id'), headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${token.toString()}"
    });
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)['data'];
      if (responseJson['error'] == null) {
        return ProductModel.fromJson(jsonDecode(response.body));
      }
    }
    throw ServerException();
  }

  @override
  Future<Product> updateProduct(
      {required id,
      required title,
      required String? category,
      required double? price,
      required String? desc,
      String? imageUrl}) async {
    String token = ""; // User token
    try {
      Map data;

      data = {
        'title': title,
        'description': desc,
        'price': price,
        'image': imageUrl,
        'category': category
      };
      var body = json.encode(data);
      final response = await client.put(
        Uri.parse('$updateProductApiLink/$id'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}"
        },
      );
      return ProductModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteProduct({required String id}) async {
    String token = ""; // User token
    try {
      await client.delete(
        Uri.parse('$updateProductApiLink/$id'),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}"
        },
      );

      return true;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Product>> getProducts() async {


     final response = await http.get(Uri.parse('$getProductsApiLink/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
