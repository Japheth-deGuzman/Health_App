// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:health_app/healthstatus/glucose/a1ctest.dart';
import 'package:health_app/healthstatus/glucose/fasting_blood_sugar_test.dart';
import 'package:health_app/healthstatus/glucose/glucose_tolerance_test.dart';
import 'package:health_app/healthstatus/glucose/random_blood_sugar.dart';

class Glucose extends StatefulWidget {
  const Glucose({Key? key}) : super(key: key);

  @override
  _GlucoseState createState() => _GlucoseState();
}

class _GlucoseState extends State<Glucose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Glucose',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildButton('AC1 Test', AC1Test()),
                  buildButton(
                      'Fasting Blood Sugar Test', FastingBloodSugarTest()),
                  buildButton('Glucose Tolerance Test', GlucoseToleranceTest()),
                  buildButton('Random Blood Sugar Test', RandomBloodSugar()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildButton(String title, var route) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => route,
            ));
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.blue))),
          ),
        ),
      ),
    );
  }
}
