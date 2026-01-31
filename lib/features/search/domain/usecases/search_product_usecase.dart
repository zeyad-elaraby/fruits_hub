import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/search/domain/repositories/search_repository.dart';

class SearchProductsUsecase {
  final SearchRepository repo;
  SearchProductsUsecase(this.repo);

  Future<Either<Failure, List<ProductEntity>>> call(String query) {
    return repo.search(query);
  }
}
