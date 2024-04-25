import 'package:dartz/dartz.dart';

import 'package:product/core/error/exception.dart';
import 'package:product/core/error/failures.dart';
import 'package:product/feature/product/data/datasource/product_remote_source.dart';
import 'package:product/feature/product/data/model/product_model.dart';
import 'package:product/feature/product/domain/entities/product_entity.dart';
import 'package:product/feature/product/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final RemoteProductDataSource remoteProductDataSource;

  ProductRepositoryImp({required this.remoteProductDataSource});


  @override
  Future<Either<Failure, ProductModel>> insertProduct(
      {required String content,
      required String title,
      required dynamic uId}) async {
    try {
      final remotedata = await remoteProductDataSource.insertProduct(
          // title: Product.title,
          // category: Product.category,
          // price: Product.price,
          // desc: Product.desc,
          // imageUrl: Product.imageUrl
          
          );

      return Right(remotedata);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String id) async {
    try {
      final remotedata = await remoteProductDataSource.deleteProduct(id: id);
      return Right(remotedata);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    try {
      final remotedata = await remoteProductDataSource.getProduct(id: id);
      return Right(remotedata);
    } on ServerException {
      return Left(ServerFailure());
    }

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product Product) async {
    try {
      final remotedata = await remoteProductDataSource.updateProduct(
          id: Product.id,
          title: Product.title,
          category: Product.category,
          price: Product.price,
          desc: Product.desc,
          imageUrl: Product.imageUrl);

      return Right(remotedata);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts()async {

    
    throw UnimplementedError();
  }
}
