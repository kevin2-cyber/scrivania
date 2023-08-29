import 'package:flutter/material.dart';
import 'package:scrivania/app/presentation/auth/login.dart';
import 'package:scrivania/app/presentation/home.dart';
import 'package:scrivania/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) => StreamBuilder(
          stream: auth.onAuthStateChange(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            }
            return const Login();
          }),
    );
  }
}
