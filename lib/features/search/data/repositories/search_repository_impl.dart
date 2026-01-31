import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/data/models/product_model.dart';

import 'package:fruits_hub/core/domain/entity/product_entity.dart';

import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/search_history_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';

import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this.databaseService, this.searchHistoryService);
  final DatabaseService databaseService;
  final SearchHistoryService searchHistoryService;
  @override
  Future<Either<Failure, List<ProductEntity>>> search(String query) async {
    try {
      final normalizedQuery = query.trim().toLowerCase();
      if (normalizedQuery.isEmpty) return Right([]);

      final data = await databaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {
          'orderBy': 'name',
          'orderType': 'asc',
          'startAt': normalizedQuery,
          'endAt': '$normalizedQuery\uf8ff',
          'limit': 20,
        },
      );
      var result = (data as List)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  List<String> getRecentSearch() {
    return searchHistoryService.getHistory();
  }

  @override
  Future<void> saveRecentSearch(String query) async {
    await searchHistoryService.addSearchTerm(query);
  }

  @override
  Future<void> clearRecentSearchItem(value) async {
    await searchHistoryService.deleteTerm(value);
  }

  @override
  Future<void> clearAllRecentSearches() async {
    await searchHistoryService.clearAllHistory();
  }
}
