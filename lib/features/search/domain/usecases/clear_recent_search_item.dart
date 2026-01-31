import 'package:fruits_hub/features/search/domain/repositories/search_repository.dart';

class ClearRecentSearchItemUsecase {
  final SearchRepository repo;

  ClearRecentSearchItemUsecase(this.repo);

  Future<void> call(String query) {
    return repo.clearRecentSearchItem(query);
  }
}
