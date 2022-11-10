import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/screens/homepage/homepage.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
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
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
            child: Text(
              'HealthApp',
              style: GoogleFonts.libreBaskerville(
                textStyle: style,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    // border: Border.all(width: 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '          HealthApp: Android Exercise Aplication is a mobile application that provides exercise that doesnt need any equipments and facilities. HealthApp helps you record and manage your BMI and Exercises. It Provides weekly summary of the exercises and notifies the user if they are inactive for a week.' +
                                '\n' +
                                '\n' +
                                '          Special thanks to healthline.com, Verrywellfit.com and cdc.gov for some of the informations that have been a basis in the application. Please keep in mind that HealthApp is simply meant to give exercise and isnt meant to be used for disease diagnosis, mitigation or prevention. Please consult first to medical proffessionals if you have health conditions before using the application. Do not attempt any motion that causes you pain and never force your body into any positions that are uncomfortable for you',
                            style: GoogleFonts.libreBaskerville(
                              textStyle: style,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1000,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
