// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:health_app/exercise/low/low.dart';
// import 'package:health_app/exercise/moderate/moderate.dart';
// import 'package:health_app/exercise/vigorous/vigorous.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/exercise/low/low_impact_jumping_jacks.dart';
import 'package:health_app/exercise/low/constants.dart';
import 'package:health_app/exercise/low/hamster_jack.dart';
import 'package:health_app/exercise/low/skaters.dart';
import 'package:health_app/exercise/low/squat_to_jab.dart';
import 'package:health_app/exercise/low/standing_oblique_crunch.dart';
import 'package:health_app/exercise/moderate/lateral_shuffles.dart';
import 'package:health_app/exercise/moderate/lunge_jumps.dart';
import 'package:health_app/exercise/moderate/squat_jumps.dart';
import 'package:health_app/exercise/moderate/squat_to_front_kick.dart';
import 'package:health_app/exercise/moderate/standing_alternating_toe_touches.dart';
import 'package:health_app/exercise/vigorous/burpees.dart';
import 'package:health_app/exercise/vigorous/diagonal_jumps.dart';
import 'package:health_app/exercise/vigorous/inchworm_crawl.dart';
import 'package:health_app/exercise/vigorous/mountain_climbers.dart';
import 'package:health_app/exercise/vigorous/rotational_jacks.dart';
import 'package:health_app/screens/homepage/homepage.dart';

class Exercise extends StatefulWidget {
  const Exercise({
    Key? key,
  }) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  late double height, width;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Colors.transparent,
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'My Exercise',
                  style: GoogleFonts.libreBaskerville(
                    textStyle: style,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ), //Text
              ),
              Container(
                width: width * .90,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: InteractiveViewer(
                  child: Image.asset(
                    'assets/images/acc/Picture11.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HamstringJacks(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/low/hamstring_jacks.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Hamstring Jacks',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.yellow,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Low Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LowImpactJumpingJacks(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/low/low_impact_jumping_jacks.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Low Impact Jumping Jacks',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.yellow,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Low Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Skaters(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage('assets/images/low/skaters.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skaters',
                                style: GoogleFonts.libreBaskerville(
                                  textStyle: style,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.yellow,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Low Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SquatToJab(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/low/squat_to_jab.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Squat to Jab',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.yellow,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Low Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StandingObliqueCrunch(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/low/standing_oblique_crunch.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Standing Oblique Crunch',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.yellow,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Low Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LateralShuffles(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/moderate/lateral_shuffles.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Lateral Shuffles',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Moderate Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LungeJumps(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/moderate/lunge_jumps.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Lunges Jumps',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Moderate Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SquatJumps(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/moderate/squat_jumps.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Squat to Jumps',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Moderate Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SquatToFrontKick(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/moderate/squat_to_front_kick.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Squat to Front Kick',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Moderate Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StandingAlternatingToeTouches(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/moderate/standing_alternating_toe_touches.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Standing Alternating Toe Touches',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.orange,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Moderate Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Burpees(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/vigorous/burpees.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Burpees',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Vigorous Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiagonalJumps(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/vigorous/diagonal_jumps.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Diagonal Jumps',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Vigorous Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InchwormCrawl(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/vigorous/inchworm_crawl.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Inchworm Crawl',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Vigorous Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MountainClimbers(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/vigorous/mountain_climbers.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Mountain Climbers',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Vigorous Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RotationalJacks(),
                  ));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 10),
                  height: 120,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(appPadding),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                                'assets/images/vigorous/rotational_jacks.gif'),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: appPadding / 2, top: appPadding / 1.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: FittedBox(
                                child: Text(
                                  'Rotational Jacks',
                                  style: GoogleFonts.libreBaskerville(
                                    textStyle: style,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.leaderboard,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Flexible(
                                      child: FittedBox(
                                    child: Text(
                                      'Vigorous Level Exercise',
                                      style: GoogleFonts.libreBaskerville(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
