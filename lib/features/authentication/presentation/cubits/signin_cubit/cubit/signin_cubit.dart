import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/authentication/data/repository/auth_repository.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/signin_cubit/cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepository) : super(SigninInitial());
  BaseAuthRepository authRepository;

  Future<void> signinUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    var result = await authRepository.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(SigninError(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepository.signInWithGoogle();
    result.fold(
      (l) => emit(SigninError(message: l.message)),
      (r) => emit(SigninSuccess(userEntity: r)),
    );
  }

  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepository.signInWithFacebook();
    result.fold(
      (l) => emit(SigninError(message: l.message)),
      (r) => emit(SigninSuccess(userEntity: r)),
    );
  }
}
