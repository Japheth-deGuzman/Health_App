// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  late Color bg;

  int? selectedId;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  var date = DateFormat('MM-dd-yyyy').format(DateTime.now());
  String result = '';
  Future<void> dialogbox(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                  height: 200,
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: _systolicController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Systolic ',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Systolic';
                              }
                              String pattern =
                                  r'^(-?[1-9]+\d*([.]\d+)?)$|^(-?0[.]\d*[1-9]+)$|^0$|^0.0$';
                              RegExp regexp = RegExp(pattern);
                              if (!regexp.hasMatch(value)) {
                                return 'Invalid';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                          SizedBox(height: 15),
                        Container(
                          child: TextFormField(
                            controller: _diastolicController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Diastolic',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Diastolic';
                              }
                              String pattern =
                                  r'^(-?[1-9]+\d*([.]\d+)?)$|^(-?0[.]\d*[1-9]+)$|^0$|^0.0$';
                              RegExp regexp = RegExp(pattern);
                              if (!regexp.hasMatch(value)) {
                                return 'Invalid';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  )),
              actions: <Widget>[
                TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          double s = double.parse(_systolicController.text);
                          double d = double.parse(_diastolicController.text);
                          if (s >= 180 && d >= 120) {
                            result = 'Hypertensive Crisis';
                          } else if (s >= 140 || d >= 90) {
                            result = 'High Blood (Stage 2)';
                          } else if (s >= 130 || d >= 89) {
                            result = 'High Blood (Stage 1)';
                          } else if (s > 120 || d > 80) {
                            result = 'Elevated';
                          } else if (s <= 120 && d <= 80) {
                            result = 'Normal';
                          }
                          DatabaseHelper.instance.addbp(BP(
                              systolic: _systolicController.text,
                              diastolic: _diastolicController.text,
                              result: result,
                              date: date));
                        });
                        Navigator.of(context).pop();
                      }
                    })
              ]);
        });
  }
final stylee = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BLOOD PRESSURE',
             style: GoogleFonts.libreBaskerville(
              textStyle: stylee,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Blood Pressure History',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: FutureBuilder<List<BP>>(
                    future: DatabaseHelper.instance.getbp(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading...'));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No BP in List'))
                          : ListView(
                              children: snapshot.data!.map((bp) {
                              double s = double.parse(bp.systolic);
                              double d = double.parse(bp.diastolic);
                              if (s >= 180 && d >= 120) {
                                bg = Colors.black;
                              } else if (s >= 140 || d >= 90) {
                                bg = Colors.red;
                              } else if (s >= 130 || d >= 89) {
                                bg = Colors.orange;
                              } else if (s > 120 || d > 80) {
                                bg = Colors.blue;
                              } else if (s <= 120 && d <= 80) {
                                bg = Colors.green;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: bg, width: 5),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  margin: EdgeInsets.all(1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Text(
                                            bp.result +
                                                ' ' +
                                                bp.systolic +
                                                '/' +
                                                bp.diastolic +
                                                '\n' +
                                                bp.date,
                                            style: TextStyle(fontSize: 15)),
                                        Expanded(child: Container()),
                                        PopupMenuButton(
                                            itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                      child: ListTile(
                                                    title: Text('Edit'),
                                                    onTap: () {
                                                      _systolicController.text =
                                                          bp.systolic;
                                                      _diastolicController
                                                          .text = bp.diastolic;
                                                      selectedId = bp.id;
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                                content:
                                                                    Container(
                                                                        height:
                                                                            200,
                                                                        child:
                                                                            Form(
                                                                          key:
                                                                              _key,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                child: TextFormField(
                                                                                  controller: _systolicController,
                                                                                  decoration: InputDecoration(
                                                                                    border: OutlineInputBorder(),
                                                                                    hintText: 'Systolic',
                                                                                  ),
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return 'Enter Systolic';
                                                                                    }
                                                                                    String pattern = r'^(-?[1-9]+\d*([.]\d+)?)$|^(-?0[.]\d*[1-9]+)$|^0$|^0.0$';
                                                                                    RegExp regexp = RegExp(pattern);
                                                                                    if (!regexp.hasMatch(value)) {
                                                                                      return 'Invalid';
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                  keyboardType: TextInputType.number,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: TextFormField(
                                                                                  controller: _diastolicController,
                                                                                  decoration: InputDecoration(
                                                                                    border: OutlineInputBorder(),
                                                                                    hintText: 'Diastolic',
                                                                                  ),
                                                                                  validator: (value) {
                                                                                    if (value!.isEmpty) {
                                                                                      return 'Enter Diastoic';
                                                                                    }
                                                                                    String pattern = r'^(-?[1-9]+\d*([.]\d+)?)$|^(-?0[.]\d*[1-9]+)$|^0$|^0.0$';
                                                                                    RegExp regexp = RegExp(pattern);
                                                                                    if (!regexp.hasMatch(value)) {
                                                                                      return 'Invalid';
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                  keyboardType: TextInputType.number,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )),
                                                                actions: <
                                                                    Widget>[
                                                                  TextButton(
                                                                    child: Text(
                                                                        'Edit'),
                                                                    onPressed:
                                                                        () {
                                                                      if (_key
                                                                          .currentState!
                                                                          .validate()) {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return AlertDialog(
                                                                                content: Text('Do you want to edit this record?'),
                                                                                actions: <Widget>[
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        setState(() {
                                                                                          double s = double.parse(_systolicController.text);
                                                                                          double d = double.parse(_diastolicController.text);
                                                                                          if (s < 120 && d < 80) {
                                                                                            result = 'Normal';
                                                                                          } else if (s >= 120 && d >= 80) {
                                                                                            result = 'Elevated';
                                                                                          } else if (s >= 130 && d == 80 - 89) {
                                                                                            result = 'High Blood (Stage 1)';
                                                                                          } else if (s >= 140 && d >= 90) {
                                                                                            result = 'High Blood (Stage 2)';
                                                                                          } else if (s >= 180 && d >= 120) {
                                                                                            result = 'Hypertensive Crisis';
                                                                                          }
                                                                                          DatabaseHelper.instance.updatebp(BP(systolic: _systolicController.text, diastolic: _diastolicController.text, result: result, date: date, id: selectedId));
                                                                                        });
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      child: Text('Edit')),
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      child: Text('Cancel'))
                                                                                ],
                                                                              );
                                                                            });
                                                                      }
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                          'Back'))
                                                                ]);
                                                          });
                                                    },
                                                  )),
                                                  PopupMenuItem(
                                                      child: ListTile(
                                                    title: Text('Delete'),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                                content: Text(
                                                                    'Delete BMI?'),
                                                                actions: <
                                                                    Widget>[
                                                                  TextButton(
                                                                      child: Text(
                                                                          'Delete'),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          DatabaseHelper
                                                                              .instance
                                                                              .deletebp(bp.id!);
                                                                        });
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      }),
                                                                  TextButton(
                                                                      child: Text(
                                                                          'Cancel'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      }),
                                                                ]);
                                                          });
                                                    },
                                                  )),
                                                ]),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          dialogbox(context);
          _systolicController.clear();
          _diastolicController.clear();
        },
      ),
    );
  }
}
