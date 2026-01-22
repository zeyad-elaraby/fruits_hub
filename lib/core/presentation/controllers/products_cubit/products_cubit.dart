import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/domain/repos/base_products_repository.dart';
import 'package:fruits_hub/core/presentation/controllers/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  BaseProductsRepository baseProductsRepo;
  ProductsCubit(this.baseProductsRepo) : super(ProductsInitial());
  int productsLength = 0;
  void getProducts() async {
    emit(ProductsLoading());
    var result = await baseProductsRepo.getProducts();
    result.fold((failure) => emit(ProductsFailure(message: failure.message)), (
      products,
    ) {
      productsLength = products.length;
      emit(ProductsSuccess(products: products));
    });
  }

  void getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await baseProductsRepo.getBestSellingProducts();
    result.fold((failure) {
      print("the failure is ${failure.message}");
      return emit(ProductsFailure(message: failure.message));
    }, (products) => emit(ProductsSuccess(products: products)));
  }
}
