import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/authentication/data/repository/auth_repository.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///cubit
    sl.registerFactory(() => SignupCubit(sl()));

    //REPOSITORY
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    //services
    sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  }
}
