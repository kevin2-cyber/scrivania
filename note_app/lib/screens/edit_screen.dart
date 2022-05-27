import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(),
    );
  }
}