import 'package:dartz/dartz.dart';
import 'package:product/core/error/failures.dart';
import 'package:product/core/usecase/usecase.dart';
import 'package:product/feature/product/data/model/product_model.dart';
import 'package:product/feature/product/domain/repositories/product_repository.dart';

class InsertProductUsecase extends Usecase<ProductModel, ProductParameter> {
  final ProductRepository ProductRepository;

  InsertProductUsecase({required this.ProductRepository});
  @override
  Future<Either<Failure, ProductModel>> call(ProductParameter params) async {
    return await ProductRepository.insertProduct(    
      
    title: params.title,
          category: params.category,
          price: params.price,
          desc: params.desc,
          imageUrl: params.imageUrl);
  }
}

class ProductParameter {


  ProductParameter({

      required String? category,
      required double? price,
      required String? desc,
      String? imageUrl
   
  });
}
