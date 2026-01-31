import 'package:fruits_hub/features/search/domain/repositories/search_repository.dart';

class ClearAllRecentSearchesUsecase {
  final SearchRepository repo;

  ClearAllRecentSearchesUsecase(this.repo);

  Future<void> call() {
    return repo.clearAllRecentSearches();
  }
}
