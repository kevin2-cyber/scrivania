import 'package:flutter/material.dart';
import 'package:note_app/screens/home.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note_it',
      theme: ThemeData.light(),
      home: const Home(),
    );
  }
}
