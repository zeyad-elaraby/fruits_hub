import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';
import 'package:fruits_hub/features/authentication/presentation/cubits/reset_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.baseAuthRepository) : super(ForgetPasswordInitial());
  final BaseAuthRepository baseAuthRepository;
  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    var result = await baseAuthRepository.forgetPassword(email);
    result.fold(
      (l) => emit(ForgetPasswordFailure(message: l.message)),
      (r) => emit(ForgetPasswordSuccess()),
    );
  }
}
