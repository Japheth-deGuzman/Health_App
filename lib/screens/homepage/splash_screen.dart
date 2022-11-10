// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  int duration = 3;
  Widget goToPage;
  SplashScreen({required this.duration, required this.goToPage});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => this.goToPage),
      );
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
            height: 200, child: Image.asset("assets/images/acc/main.png")),
      ),
    );
  }
}
