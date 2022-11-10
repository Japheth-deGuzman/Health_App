import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/healthstatus/blood_pressure.dart';
import 'package:health_app/healthstatus/bmi/bmi.dart';
import 'package:health_app/healthstatus/glucose/blood_glucoes.dart';

class HealthStatus extends StatefulWidget {
  const HealthStatus({Key? key}) : super(key: key);

  @override
  _HealthStatusState createState() => _HealthStatusState();
}

class _HealthStatusState extends State<HealthStatus> {
  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 117, 226),
              Color.fromARGB(255, 135, 255, 179)
            ],
          ).createShader(rect),
          child: Text(
            'HealthApp',
            style: GoogleFonts.libreBaskerville(
              textStyle: style,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 60,
                color: Colors.transparent,
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Health Records',
                  style: GoogleFonts.libreBaskerville(
                    textStyle: style,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ), //Text
              ),
              SizedBox(height: 18),
              Container(
                width: width * .90,
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildButton('BMI', BMIpage()),
                    SizedBox(height: 18),
                    buildButton('Blood Pressure', BloodPressure()),
                    SizedBox(height: 18),
                    buildButton('Blood Glucose', Glucose()),
                  ],
                ),
              ),
            ], //Text
          ), //Container
          //Container//Container
        ], //<Widget>[]
      ), //Stack
      //Center
    );
  }

  Container buildButton(String title, var route) {
    final shape = StadiumBorder();
    return Container(
      decoration: ShapeDecoration(
          shape: shape,
          gradient: LinearGradient(colors: [
            Colors.greenAccent.shade100,
            Colors.lightBlue.shade400,
          ])),
      child: Container(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => route,
            ));
          },
          child: Text(
            title,
            style: GoogleFonts.libreBaskerville(
              textStyle: style,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
          ),
        ),
      ),
    );
  }
}
