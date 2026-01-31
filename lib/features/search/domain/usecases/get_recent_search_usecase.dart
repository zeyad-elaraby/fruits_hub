import 'package:fruits_hub/features/search/domain/repositories/search_repository.dart';

class GetRecentSearchesUsecase {
  final SearchRepository repo;

  GetRecentSearchesUsecase(this.repo);

  List<String> call() {
    return repo.getRecentSearch();
  }
}
