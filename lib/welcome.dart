import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: (){
                Navigator.pop(
                  context,
                );
              },
              height: 50.0,
              minWidth: 200.0,
              color: Colors.black,
              shape: const StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
