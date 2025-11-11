import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.uId, required super.email});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }

  toJson() {
    return {'uId': uId, 'name': name, 'email': email};
  }

  static fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
    );
  }
}
