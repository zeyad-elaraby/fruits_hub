import 'package:fruits_hub/core/data/repos/products_repository.dart';
import 'package:fruits_hub/core/domain/repos/base_products_repository.dart';
import 'package:fruits_hub/core/presentation/controllers/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/core/services/search_history_service.dart';
import 'package:fruits_hub/features/authentication/data/repository/auth_repository.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/checkout/data/models/repository/orders_repository.dart';
import 'package:fruits_hub/features/checkout/domain/repository/base_orders_repository.dart';
import 'package:fruits_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruits_hub/features/search/data/repositories/search_repository_impl.dart';
import 'package:fruits_hub/features/search/domain/repositories/search_repository.dart';
import 'package:fruits_hub/features/search/domain/usecases/clear_all_recent_searches_usecase.dart';
import 'package:fruits_hub/features/search/domain/usecases/clear_recent_search_item.dart';
import 'package:fruits_hub/features/search/domain/usecases/get_recent_search_usecase.dart';
import 'package:fruits_hub/features/search/domain/usecases/save_recent_search_usecase.dart';
import 'package:fruits_hub/features/search/domain/usecases/search_product_usecase.dart';
import 'package:fruits_hub/features/search/presentation/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///cubit
    sl.registerFactory(() => SignupCubit(sl()));
    sl.registerFactory(() => SigninCubit(sl()));
    sl.registerFactory(() => ProductsCubit(sl()));
    sl.registerFactory(() => CartCubit());
    sl.registerFactory(() => CheckoutCubit(sl()));
    sl.registerFactory(() => ForgetPasswordCubit(sl()));
    sl.registerFactory(() => SearchCubit(sl(), sl(), sl(), sl(), sl()));

    //REPOSITORY
    sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(sl(), sl()),
    );
    sl.registerLazySingleton<BaseProductsRepository>(
      () => ProductsRepository(sl()),
    );
    sl.registerLazySingleton<BaseOrdersRepository>(
      () => OrdersRepository(sl()),
    );
    sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(sl(), sl()),
    );

    //services
    sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
    sl.registerLazySingleton<DatabaseService>(() => FirestoreService());
    sl.registerLazySingleton<SearchHistoryService>(
      () => SearchHistoryService(),
    );
    //usecases
    sl.registerLazySingleton<SearchProductsUsecase>(
      () => SearchProductsUsecase(sl()),
    );
    sl.registerLazySingleton<SaveRecentSearchesUsecase>(
      () => SaveRecentSearchesUsecase(sl()),
    );
    sl.registerLazySingleton<GetRecentSearchesUsecase>(
      () => GetRecentSearchesUsecase(sl()),
    );
    sl.registerLazySingleton<ClearRecentSearchItemUsecase>(
      () => ClearRecentSearchItemUsecase(sl()),
    );
    sl.registerLazySingleton<ClearAllRecentSearchesUsecase>(
      () => ClearAllRecentSearchesUsecase(sl()),
    );
  }
}
