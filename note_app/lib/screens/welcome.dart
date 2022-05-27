import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'edit_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black26,
                      ),
                      height: 45.0,
                      // width: 4.0,
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 250.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black26
                      ),
                      height: 45.0,
                      // width: 50.0,
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Hello World',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const EditScreen()));
        },
        tooltip: 'Add To do',
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}