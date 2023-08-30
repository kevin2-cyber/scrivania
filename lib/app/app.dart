import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrivania/app/presentation/app_settings.dart';
import 'package:scrivania/app/presentation/home.dart';

class Scrivania extends StatelessWidget {
  const Scrivania({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrivania',
      theme: ThemeData.light(
        useMaterial3: true
      ).copyWith(
          textTheme: GoogleFonts.spaceGroteskTextTheme()
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.spaceGroteskTextTheme()
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
