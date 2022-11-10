import 'package:flutter/material.dart';
// import 'package:health_app/db/dbhealthapp.dart';
// import 'package:health_app/db/models.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:health_app/widgets/hestory.dart';
import 'package:health_app/widgets/Weekly.dart';
// import 'package:health_app/screens/homepage/exercise.dart';
import 'package:health_app/screens/homepage/homepage.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
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
              bottom: TabBar(
                  labelStyle: GoogleFonts.libreBaskerville(
                    textStyle: style,
                    fontSize: 13,
                  ),
                  indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Exercise History'),
                    Tab(text: 'Weekly Summary')
                  ]),
            ),
            body: TabBarView(
              children: [Hestory(), Aboutt()],
            )),
      );
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
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
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
