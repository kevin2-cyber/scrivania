
import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/constants.dart';

class AuthFirestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveData(
      String uid,
      String email,
      String name
      ) async {
    try {
      await _firestore.collection(Constants.user).doc(uid).set({
        "email" : email,
        "name" : name
      });
    } catch (e) {
      rethrow;
    }
  }
}