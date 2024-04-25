import 'package:dartz/dartz.dart';
import 'package:product/core/usecase/usecase.dart';
import 'package:product/feature/product/data/model/product_model.dart';
import 'package:product/feature/product/domain/repositories/product_repository.dart';

class InsertProductUsecase extends Usecase<ProductModel, ProductParameter> {
  final ProductRepository ProductRepository;

  InsertProductUsecase({required this.ProductRepository});
  @override
  Future<Either<Failure, ProductModel>> call(ProductParameter params) async {
    return await ProductRepository.insertProduct(     uId:   params.uId, title: params.title,content: params.content);
  }
}

class ProductParameter {


  ProductParameter({
    
  });
}
