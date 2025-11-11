import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/authentication/data/models/user_model.dart';
import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/authentication/domain/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  FirebaseAuthService firebaseAuthService;
  DatabaseService databaseService;
  AuthRepository(this.firebaseAuthService, this.databaseService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email.trim(),
        password.trim(),
      );
      var userEntity = UserEntity(name: name, uId: user.uid, email: email);
      await addUserData(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      log(
        "exception in AuthRepository.createUserWithEmailAndPassword ${e.toString()}",
      );
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);

      log(
        "exception in AuthRepository.createUserWithEmailAndPassword ${e.toString()}",
      );

      return Left(ServerFailure('please try again'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email.trim(),
        password.trim(),
      );
      UserEntity userEntity = await getUserData(uId: user.uid);
      return Right(userEntity);
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      bool userExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.checkIfUserExists,
        documentId: user.uid,
      );

      if (userExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(userEntity);
      }

      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("exception in AuthRepository.signInWithGoogle ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      bool userExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.checkIfUserExists,
        documentId: user.uid,
      );

      if (userExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(userEntity);
      }

      // try {
      //   await getUserData(uId: user.uid);
      // } catch (e) {
      //   await addUserData(userEntity);
      // }

      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("exception in AuthRepository.signInWithFacebook ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future addUserData(UserEntity user) async {
    UserModel userModel = UserModel(
      uId: user.uId,
      name: user.name,
      email: user.email,
    );

    return await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: userModel.toJson(),
      uId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    Map<String, dynamic> userData = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }
}
