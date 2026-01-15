import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/features/authentication/data/models/user_model.dart';
import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        log(
          "exception in firebaseAuthService.createUserWithEmailAndPassword ${e.toString()} and code is ${e.code}",
        );
      }
      throw CustomException(message: handleEmailAndPasswordAuthExceptions(e));
    } catch (e) {
      if (kDebugMode) {
        log(
          "exception in firebaseAuthService.createUserWithEmailAndPassword ${e.toString()}",
        );
      }
      throw CustomException(message: e.toString());
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: handleEmailAndPasswordAuthExceptions(e));
    } catch (e) {
      if (kDebugMode) {
        log(
          "exception in firebaseAuthService.signInWithEmailAndPassword ${e.toString()} ",
        );
      }
      throw CustomException(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: handleEmailAndPasswordAuthExceptions(e));
    } catch (e) {
      throw CustomException(message: 'Failed to sign out. Please try again.');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: handleEmailAndPasswordAuthExceptions(e));
    } catch (e) {
      throw CustomException(
        message: 'Failed to send reset email. Please try again.',
      );
    }
  }

  Future<void> deleteUser() async {
    try {
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: handleEmailAndPasswordAuthExceptions(e));
    } catch (e) {
      throw CustomException(
        message: 'Failed to delete account. Please try again.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  bool isLoggedIn() {
    final hasCurrentUser = _auth.currentUser != null;

    final hasUserData = Prefs.getString(kUserData) != null;

    return hasCurrentUser && hasUserData;
  }

  /// Centralized exception handler for all Firebase Auth error codes
  String handleEmailAndPasswordAuthExceptions(FirebaseAuthException e) {
    switch (e.code) {
      // Registration/Sign up errors
      case 'weak-password':
        return 'The password is too weak. Please use at least 6 characters with a mix of uppercase, lowercase, numbers, and symbols.';
      case 'email-already-in-use':
        return 'An account already exists for this email address. Please sign in or use a different email.';
      case 'invalid-email':
        return 'The email address is invalid. Please enter a valid email.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';

      // Sign in errors
      case 'user-disabled':
        return 'Your account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No account found with this email address. Please sign up.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-credential':
        return 'Invalid email or password. Please try again.';

      // Password reset errors
      case 'user-mismatch':
        return 'The credentials do not match. Please try again.';
      case 'invalid-verification-code':
        return 'The verification code is invalid or expired. Please request a new one.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Please try again.';

      // Network/Connection errors
      case 'network-request-failed':
        return 'Network error. Please check your internet connection and try again.';
      case 'too-many-requests':
        return 'Too many attempts. Please wait a few minutes before trying again.';

      // Account deletion errors
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please sign in again.';

      // Configuration/Setup errors
      case 'invalid-api-key':
        return 'Invalid API key. Please check your Firebase configuration.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication.';
      case 'invalid-app-credential':
        return 'Invalid app credentials. Please check your Firebase setup.';

      // Other common errors
      case 'channel-error':
        return 'A channel error occurred. Please try again later.';
      case 'missing-email':
        return 'Email address is required.';
      case 'missing-password':
        return 'Password is required.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different sign-in method.';
      case 'credential-already-in-use':
        return 'This credential is already associated with another account.';
      case 'email-already-in-use':
        return 'This email is already associated with another account.';

      // Fallback for unknown error codes
      default:
        return 'An authentication error occurred: ${e.message ?? 'Unknown error'}. Please try again.';
    }
  }
}
