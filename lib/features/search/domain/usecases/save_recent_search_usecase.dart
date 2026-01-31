import 'package:fruits_hub/features/search/domain/repositories/search_repository.dart';

class SaveRecentSearchesUsecase {
  final SearchRepository repo;

  SaveRecentSearchesUsecase(this.repo);

  Future<void> call(String query) {
    return repo.saveRecentSearch(query);
  }
}
