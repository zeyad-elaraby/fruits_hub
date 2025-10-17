import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';

abstract class SignupState {}

class SignUpInitial extends SignupState {}

class SignUpLoading extends SignupState {}

class SignUpSuccess extends SignupState {
  UserEntity userEntity;
  SignUpSuccess({required this.userEntity});
}

class SignUpError extends SignupState {
  String message;
  SignUpError({required this.message});
}
