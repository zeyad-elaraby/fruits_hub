import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/data/models/product_model.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/domain/repos/base_products_repository.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/authentication/data/models/user_model.dart';

class ProductsRepository implements BaseProductsRepository {
  DatabaseService dataBaseService;
  ProductsRepository(this.dataBaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await dataBaseService.getData(
                path: BackendEndpoints.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'orderType': 'desc',
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> result = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await dataBaseService.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> result = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('failed to fetch products'));
    }
  }
}
