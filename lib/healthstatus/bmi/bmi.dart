// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIpage extends StatefulWidget {
  const BMIpage({Key? key}) : super(key: key);

  @override
  _BMIpageState createState() => _BMIpageState();
}

class _BMIpageState extends State<BMIpage> {
  late Color bg;
  var bMi;
  int? selectedId;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double bmi = 0;
  String result = '';

  var date = DateFormat('MM-dd-yyyy').format(DateTime.now());
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
                            controller: _weightController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Weight ',
                              helperText: 'kg',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Weight';
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
                        SizedBox(height: 20),
                        Container(
                          child: TextFormField(
                            controller: _heightController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Height',
                              helperText: 'm',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Height';
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
                          double w = double.parse(_weightController.text);
                          double h = double.parse(_heightController.text);
                          bmi = w / (h * h);

                          if (bmi >= 30) {
                            result = "Obesity";
                          } else if (bmi >= 25) {
                            result = "Overwieght";
                          } else if (bmi >= 18.5) {
                            result = "Healthy Weight";
                          } else {
                            result = "Underweight";
                          }

                          DatabaseHelper.instance.addbmi(Bmi(
                              bmi: bmi.toStringAsFixed(2),
                              weight: _weightController.text,
                              height: _heightController.text,
                              date: '$date',
                              result: '$result'));
                        });
                        Navigator.of(context).pop();
                      }
                    })
              ]);
        });
  }

  final style = TextStyle(fontSize: 13);
  final stylee = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BODY MASS INDEX',
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
                Container(
                  child: InteractiveViewer(
                    child: Image.asset(
                      'assets/images/health_record/Bmi.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'BMI History',
                    style: GoogleFonts.libreBaskerville(
                      textStyle: stylee,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<List<Bmi>>(
                    future: DatabaseHelper.instance.getBMI(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading...'));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No BMI in List'))
                          : ListView(
                              children: snapshot.data!.map((bmis) {
                              bMi = double.parse(bmis.bmi);
                              if (bMi >= 30) {
                                bg = Colors.red;
                              } else if (bMi >= 25) {
                                bg = Colors.orange;
                              } else if (bMi >= 18.5) {
                                bg = Colors.green;
                              } else {
                                bg = Colors.blue;
                              }
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 120,
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
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Height: ' +
                                                bmis.height +
                                                ' m' +
                                                '\n' +
                                                'Weight: ' +
                                                bmis.weight +
                                                ' kg' +
                                                '\n' +
                                                'Weight Status: ' +
                                                bmis.result +
                                                '\n' +
                                                'BMI: ' +
                                                bmis.bmi +
                                                '\n' +
                                                'Date: ' +
                                                bmis.date,
                                            style: GoogleFonts.libreBaskerville(
                                              textStyle: style,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          PopupMenuButton(
                                              itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                        child: ListTile(
                                                      title: Text('Edit'),
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        _weightController.text =
                                                            bmis.weight;
                                                        _heightController.text =
                                                            bmis.height;
                                                        selectedId = bmis.id;

                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                  content:
                                                                      Container(
                                                                          height:
                                                                              170,
                                                                          child:
                                                                              Form(
                                                                            key:
                                                                                _key,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Container(
                                                                                  child: TextFormField(
                                                                                    controller: _weightController,
                                                                                    decoration: InputDecoration(
                                                                                      border: OutlineInputBorder(),
                                                                                      hintText: 'Weight ',
                                                                                      helperText: 'kg',
                                                                                    ),
                                                                                    validator: (value) {
                                                                                      if (value!.isEmpty) {
                                                                                        return 'Enter Weight';
                                                                                      }
                                                                                    },
                                                                                    keyboardType: TextInputType.number,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(height: 20),
                                                                                Container(
                                                                                  child: TextFormField(
                                                                                    controller: _heightController,
                                                                                    decoration: InputDecoration(
                                                                                      border: OutlineInputBorder(),
                                                                                      hintText: 'Height',
                                                                                      helperText: 'm',
                                                                                    ),
                                                                                    validator: (value) {
                                                                                      if (value!.isEmpty) {
                                                                                        return 'Enter Height';
                                                                                      }
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
                                                                          'Save'),
                                                                      onPressed:
                                                                          () {
                                                                        if (_key
                                                                            .currentState!
                                                                            .validate()) {
                                                                          PanaraConfirmDialog
                                                                              .showAnimatedGrow(
                                                                            context,
                                                                            title:
                                                                                "Are You Sure",
                                                                            message:
                                                                                "Do you want to change your BMI.",
                                                                            confirmButtonText:
                                                                                "Confirm",
                                                                            cancelButtonText:
                                                                                "Cancel",
                                                                            onTapCancel:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            onTapConfirm:
                                                                                () {
                                                                              setState(() {
                                                                                double w = double.parse(_weightController.text);
                                                                                double h = double.parse(_heightController.text);
                                                                                bmi = w / (h * h);

                                                                                if (bmi >= 30) {
                                                                                  result = "Obesity";
                                                                                } else if (bmi >= 25) {
                                                                                  result = "Overwieght";
                                                                                } else if (bmi >= 18.5) {
                                                                                  result = "Healthy Weight";
                                                                                } else {
                                                                                  result = "Underweight";
                                                                                }

                                                                                DatabaseHelper.instance.updatebmi(Bmi(id: selectedId, bmi: bmi.toStringAsFixed(2), weight: _weightController.text, height: _heightController.text, date: bmis.date, result: '$result'));
                                                                              });
                                                                              Navigator.pop(context);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            panaraDialogType:
                                                                                PanaraDialogType.normal,
                                                                          );
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
                                                                            'Cancel'))
                                                                  ]);
                                                            });
                                                      },
                                                    )),
                                                    PopupMenuItem(
                                                        child: ListTile(
                                                      title: Text('Delete'),
                                                      onTap: () {
                                                        PanaraConfirmDialog
                                                            .showAnimatedGrow(
                                                          context,
                                                          title: "Are You Sure",
                                                          message:
                                                              "Do you want to delete your BMI.",
                                                          confirmButtonText:
                                                              "Confirm",
                                                          cancelButtonText:
                                                              "Cancel",
                                                          onTapCancel: () {
                                                            Navigator.pop(
                                                                context);
                                                                Navigator.pop(
                                                                context);
                                                          },
                                                          onTapConfirm: () {
                                                            setState(() {
                                                              DatabaseHelper
                                                                  .instance
                                                                  .deletebmi(
                                                                      bmis.id!);
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          panaraDialogType:
                                                              PanaraDialogType
                                                                  .normal,
                                                        );
                                                      },
                                                    )),
                                                  ])
                                        ],
                                      ),
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
          _weightController.clear();
          _heightController.clear();
        },
      ),
    );
  }
}
