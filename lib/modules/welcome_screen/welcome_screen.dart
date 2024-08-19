import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_final_year_application/layout/app_layout_screen.dart';
import 'package:flutter_final_year_application/modules/sigin_screen/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Directionality(
                    textDirection: TextDirection.rtl, child: SigninScreen()))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Color.fromARGB(255, 7, 158, 184),
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الثروة الحيوانية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage('asset/images/welcome cow.png'),
                  height: 47,
                  width: 47,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 72,
            ),
            child: Container(
              child: Image(
                image: AssetImage('asset/images/spring.png'),
                height: 91,
                width: 91,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
