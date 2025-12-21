import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
