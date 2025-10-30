import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/authentication/data/models/user_model.dart';
import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  FirebaseAuthService firebaseAuthService;

  AuthRepository(this.firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log(
        "exception in AuthRepository.createUserWithEmailAndPassword ${e.toString()}",
      );
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        "exception in AuthRepository.createUserWithEmailAndPassword ${e.toString()}",
      );

      return Left(ServerFailure('please try again'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (exception) {
      log(
        "exception in AuthRepository.signInWithEmailAndPassword ${exception.message}",
      );
      return Left(ServerFailure(exception.message));
    } catch (e) {
      log(
        "exception in AuthRepository.signInWithEmailAndPassword ${e.toString()}",
      );

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      User user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("exception in AuthRepository.signInWithGoogle ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      User user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("exception in AuthRepository.signInWithFacebook ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}
