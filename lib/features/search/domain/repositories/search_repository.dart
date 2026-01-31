import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/domain/entity/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<ProductEntity>>> search(String query);
  Future<void> saveRecentSearch(String query);
  List<String> getRecentSearch();
  Future<void> clearRecentSearchItem(String value);
  Future<void> clearAllRecentSearches();
}
