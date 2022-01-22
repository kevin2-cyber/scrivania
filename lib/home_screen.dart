import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_app/welcome.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/screen.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Note It',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                'A SAMPLE TO DO APPLICATION',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 500.0,
              ),
              MaterialButton(
                height: 50.0,
                minWidth: 200.0,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Welcome()));
                },
                shape: const StadiumBorder(),
                color: Colors.red,
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
