import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/search/domain/usecases/clear_all_recent_searches_usecase.dart';
import 'package:fruits_hub/features/search/domain/usecases/clear_recent_search_item.dart';
import 'package:fruits_hub/features/search/domain/usecases/get_recent_search_usecase.dart';
import 'package:fruits_hub/features/search/domain/usecases/save_recent_search_usecase.dart';
import 'package:fruits_hub/features/search/domain/usecases/search_product_usecase.dart';
import 'package:fruits_hub/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProductsUsecase searchProducts;
  final GetRecentSearchesUsecase getRecentSearches;
  final SaveRecentSearchesUsecase saveRecentSearch;
  final ClearRecentSearchItemUsecase clearRecentSearchItem;
  final ClearAllRecentSearchesUsecase clearAllRecentSearches;

  SearchCubit(
    this.searchProducts,
    this.getRecentSearches,
    this.saveRecentSearch,
    this.clearRecentSearchItem,
    this.clearAllRecentSearches,
  ) : super(SearchInitial());

  void init() {
    final recent = getRecentSearches();
    if (recent.isEmpty) {
      emit(SearchInitial());
    } else {
      emit(SearchRecentLoaded(recent));
    }
  }

  Timer? _debounce;

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      final history = getRecentSearches();
      emit(SearchRecentLoaded(history));
      _debounce?.cancel();
    } 
    else {
      if (_debounce?.isActive == true) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        onSearchSubmitted(query);
      });
    }
  }

  Future<void> onSearchSubmitted(String query) async {
    if (query.trim().isEmpty) return;

    emit(SearchLoading());

    final results = await searchProducts(query);

    results.fold((failure) => emit(SearchError(failure.message)), (products) {
      if (products.isEmpty) {
        emit(SearchEmptyResult());
      } else {
        emit(SearchSuccess(products));
      }
    });
  }

  List<String> getRecentSearchesList() {
    return getRecentSearches();
  }

  void saveRecent(String query) {
    saveRecentSearch(query);
  }

  void clearAllRecent() {
    clearAllRecentSearches();
    init();
  }

  Future<void> clearRecentItem(String query) async {
    await clearRecentSearchItem(query);
    init();
  }
}
