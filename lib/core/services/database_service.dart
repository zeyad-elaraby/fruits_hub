import 'package:fruits_hub/features/authentication/domain/entities/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
}
