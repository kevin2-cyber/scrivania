import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrivania/app/app.dart';
import 'package:scrivania/core/constants.dart';
import 'package:scrivania/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  // initialize hive
  await Hive.initFlutter();

  // opens a hive box
  await Hive.openBox(Constants.noteDatabase);
  runApp(const Scrivania());
}

