import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scrivania/app/app.dart';
import 'package:scrivania/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const Scrivania());
}

