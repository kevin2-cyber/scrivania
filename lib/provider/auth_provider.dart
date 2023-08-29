
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrivania/repository/auth_repository.dart';
import 'package:scrivania/repository/user_firestore.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepository repository = AuthRepository();
  AuthFirestore firestore = AuthFirestore();

  Stream onAuthStateChange() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await repository.login(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      final user = await repository.register(name, email, password);
      await firestore.saveData(user.user!.uid, email, name);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    return await repository.logout();
  }
}