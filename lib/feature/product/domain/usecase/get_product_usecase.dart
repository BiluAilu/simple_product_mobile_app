import 'package:dartz/dartz.dart';
import 'package:product/core/error/failures.dart';
import 'package:product/core/usecase/usecase.dart';
import 'package:product/feature/product/domain/entities/product_entity.dart';


class GetProductUsecase extends Usecase<Product,String>{
     final ProductRepository ProductRepository;

  GetProductUsecase({required this.ProductRepository});

  @override
  Future<Either<Failure, Product>> call(String  id) async{

    return await ProductRepository.getProduct(id);


  }

}

