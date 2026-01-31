import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (query != null) {
        if (query['where'] != null) {
          for (final condition in query['where']) {
            data = data.where(
              condition['field'],
              isEqualTo: condition['isEqualTo'],
            );
          }
        }

        if (query['orderBy'] != null && query['orderType'] != null) {
          data = data.orderBy(
            query['orderBy'],
            descending: query['orderType'] == 'desc',
          );
        }

        if (query['startAt'] != null) {
          data = data.startAt([query['startAt']]);
        }

        if (query['endAt'] != null) {
          data = data.endAt([query['endAt']]);
        }

        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.exists;
    }

    if (query != null) {
      Query collectionRef = firestore.collection(path);

      query.forEach((key, value) {
        collectionRef = collectionRef.where(key, isEqualTo: value);
      });

      var data = await collectionRef.limit(1).get();
      return data.docs.isNotEmpty;
    }

    return false;
  }
}
