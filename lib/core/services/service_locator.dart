import 'package:fruits_hub/core/data/repos/products_repository.dart';
import 'package:fruits_hub/core/domain/repos/base_products_repository.dart';
import 'package:fruits_hub/core/presentation/controllers/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/authentication/data/repository/auth_repository.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///cubit
    sl.registerFactory(() => SignupCubit(sl()));
    sl.registerFactory(() => SigninCubit(sl()));
    sl.registerFactory(() => ProductsCubit(sl()));
    sl.registerFactory(() => CartCubit());

    //REPOSITORY
    sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(sl(), sl()),
    );
    sl.registerLazySingleton<BaseProductsRepository>(
      () => ProductsRepository(sl()),
    );

    //services
    sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
    sl.registerLazySingleton<DatabaseService>(() => FirestoreService());
  }
}
