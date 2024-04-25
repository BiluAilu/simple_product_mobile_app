
import 'package:dartz/dartz.dart';
import 'package:product/core/error/failures.dart';
import 'package:product/feature/product/data/model/product_model.dart';
import 'package:product/feature/product/domain/entities/product_entity.dart';

abstract class ProductRepository {

  
  
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProduct(String id);  
  Future<Either<Failure, ProductModel>> insertProduct({required uId,required String title,required String content});
  Future<Either<Failure, Product>> updateProduct(Product Product);
  Future<Either<Failure, bool>> deleteProduct(String id);
}
