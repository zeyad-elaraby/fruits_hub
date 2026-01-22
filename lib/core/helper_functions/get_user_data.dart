import 'dart:convert';

import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/features/authentication/data/models/user_model.dart';
import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';

UserEntity getUserData() {
  String? jsonString = Prefs.getString(kUserData);
  var userJsonData = jsonDecode(jsonString ?? "");
  UserEntity userData = UserModel.fromJson(userJsonData);
  return userData;
}
