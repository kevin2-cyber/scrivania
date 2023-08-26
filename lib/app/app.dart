import 'package:flutter/material.dart';
import 'package:scrivania/app/presentation/home.dart';

class Scrivania extends StatelessWidget {
  const Scrivania({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
