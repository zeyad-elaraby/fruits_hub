import 'package:fruits_hub/core/domain/entity/product_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmptyResult extends SearchState {
  SearchEmptyResult();
}

class SearchSuccess extends SearchState {
  final List<ProductEntity> products;
  SearchSuccess(this.products);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

class SearchRecentLoaded extends SearchState {
  final List<String> recentQueries;
  SearchRecentLoaded(this.recentQueries);
}
