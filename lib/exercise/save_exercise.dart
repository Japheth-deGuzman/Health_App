// ignore_for_file: unused_import, unused_label, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:health_app/exercise/low/low.dart';
import 'package:health_app/screens/homepage/homepage.dart';
import 'package:intl/intl.dart';
import 'package:locally/locally.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SaveExercise extends StatefulWidget {
  final String? exercise;
  final String time;
  final String level;
  final String secs;
  const SaveExercise(
      {Key? key,
      required this.exercise,
      required this.time,
      required this.secs,
      required this.level})
      : super(key: key);

  @override
  _SaveExerciseState createState() => _SaveExerciseState();
}

class _SaveExerciseState extends State<SaveExercise> {
  var exercises;
  var title;
  var message;
  late Box<List> summary;
  late Box<List> summaryy;
  late Box<int> first;
  late Box<int> last;
  late Box<int> temp_first;
  late Box<int> temp_last;
  late Box<String> datee;
  late Locally locally;
  late Box<int> huhu;
  late Box<int> huhuh;
  late Box<int> min;
  late Box<int> temp;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    summary = Hive.box<List>("summary");
    summaryy = Hive.box<List>("summaryy");
    first = Hive.box<int>("first");
    last = Hive.box<int>("last");
    temp_first = Hive.box<int>("temp_first");
    temp_last = Hive.box<int>("temp_last");
    last = Hive.box<int>("last");
    datee = Hive.box<String>("datee");
    huhu = Hive.box<int>("huhu");
    huhuh = Hive.box<int>("huhuh");
    min = Hive.box<int>("min");
    temp = Hive.box<int>("temp");
  }

  showMessage() {
    var a = ('A good day!');
    var b = ('It has been a week of not doing exercise, Let us exercise now!');
    locally = Locally(
      context: context,
      payload: 'test',
      pageRoute: MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
      appIcon: 'mipmap/ic_launcher',
    );
    locally.schedule(title: (a), message: (b), duration: Duration(days: 7));
  }

  cancelmessage() {
    locally.cancelAll();
  }

  String date = DateFormat('MM-dd-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy -').format(now);
    var seven = DateTime.now().add(const Duration(days: 6));
    var hey = DateTime.now();
    DateFormat dateFormate = DateFormat("dd");
    DateFormat dateFormat = DateFormat(" MMMM dd, yyyy");
    String sevendays = dateFormat.format(seven);
    String firsttt = dateFormate.format(hey);
    String lastt = dateFormate.format(seven);
    var lasttt = int.parse(lastt);
    var firsst = int.parse(firsttt);
    var fil = formattedDate + sevendays;

    var ei = DateTime.now().add(const Duration(days: 13));
    String eigh = dateFormate.format(ei);
    var eight = int.parse(eigh);

    if (temp_first.isEmpty) {
      temp_first.add(eight);
    }
    temp_last.add(lasttt);

    var temp_ferst = temp_first.valuesBetween();
    var temp_fersst = temp_ferst.first;

    var temp_lust = temp_last.valuesBetween();
    var temp_hito = temp_lust.last;

    if (first.isEmpty) {
      first.add(lasttt);
    }

    // first.add(firsst);

    last.add(lasttt);

    var ferst = first.valuesBetween();
    var fersst = ferst.first;

    var lust = last.valuesBetween();
    var hito = lust.last;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercise',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child:
                      Text('Exercise Details', style: TextStyle(fontSize: 25)),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    child: Center(
                        child: Text("Time: ${widget.time + ':' + widget.secs} ",
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.black))),
                    width: 300,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Text('$date',
                        style: TextStyle(fontSize: 30.0, color: Colors.black)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Text('${widget.exercise}',
                        style: TextStyle(fontSize: 20.0, color: Colors.black)),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Delete',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black54),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.black))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: 120,
                      child: TextButton(
                        onPressed: () {
                          DatabaseHelper.instance.addexe(Exercise(
                              exercise: '${widget.exercise}',
                              time: '${widget.time}',
                              secs: '${widget.secs}',
                              level: '${widget.level}',
                              date: '$date'));
                          Navigator.of(context).pop();
                          showMessage();
                          cancelmessage();
                          showMessage();

                          var op = widget.secs;
                          var cf = int.parse(op);
                          summary.add([cf]);
                          var halaga = summary.values;
                          var sumo = halaga.reduce((cc, d) => cc + d);
                          var tw = sumo.reduce((nm, n) => nm + n);
                          huhu.add(tw);
                          var pinal = huhu.valuesBetween();
                          var pinale = pinal.last;

                          var opp = widget.time;
                          var cff = int.parse(opp);
                          summaryy.add([cff]);
                          var halagaa = summaryy.values;
                          var sumoo = halagaa.reduce((ccc, dd) => ccc + dd);
                          var tww = sumoo.reduce((nmd, nd) => nmd + nd);
                          huhuh.add(tww);
                          var pinall = huhuh.valuesBetween();
                          var pinalee = pinall.last;
                          min.add(pinalee);

                          if (pinale > 59) {
                            var whole = pinale ~/ 60;
                            var rem = pinale % 60;
                            var x = whole + pinalee;
                            temp.add(rem);

                            var pina = temp.valuesBetween();
                            var pin = pina.last;

                            huhu.add(pin);
                            min.add(x);
                          }

                          var lk = min.valuesBetween();
                          var minu = lk.last;

                          var bnm = '$fil ' +
                              '\n' +
                              'Time: ' +
                              '$minu' +
                              ' min ' +
                              ' and ' +
                              '$pinale' +
                              ' sec ';

                          if (fersst == hito) {
                            datee.add(fil);
                            first.putAt(0, eight);
                          }

                          if (temp_fersst == temp_hito) {
                            DatabaseHelper.instance
                                .addsumm(Summary(summary: '$bnm'));
                            temp_first.putAt(0, eight);
                            summary.clear();
                            summaryy.clear();
                            datee.clear();
                            min.add(0);
                            huhu.add(0);
                          }
                        },
                        child: Text(
                          'Save',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black54),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.black))),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
