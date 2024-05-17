import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pocketjob/screens/signin.dart';
import 'package:pocketjob/utils/texts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
          child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          Text(
            "Pocket Job",
            style: heading(),
          )
        ],
      )),
    );
  }
}
