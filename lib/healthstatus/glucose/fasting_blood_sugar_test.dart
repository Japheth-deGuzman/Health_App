import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:intl/intl.dart';

class FastingBloodSugarTest extends StatefulWidget {
  const FastingBloodSugarTest({Key? key}) : super(key: key);

  @override
  _FastingBloodSugarTestState createState() => _FastingBloodSugarTestState();
}

class _FastingBloodSugarTestState extends State<FastingBloodSugarTest> {
  late Color bg;
  int? selectedId;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _fbstController = TextEditingController();
  String result = '';
  var date = DateFormat('MM-dd-yyyy').format(DateTime.now());
  Future<void> dialogbox(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                  height: 100,
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: _fbstController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Test',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Fasting Blood Sugar';
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
                          double w = double.parse(_fbstController.text);

                          if (w >= 126) {
                            result = "Diabetes";
                          } else if (w >= 100) {
                            result = "PreDiabetes";
                          } else {
                            result = "Normal";
                          }

                          DatabaseHelper.instance.addFBST(FBST(
                              result: result,
                              fbst: _fbstController.text,
                              date: date));
                        });
                        Navigator.of(context).pop();
                      }
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fasting Blood Sugar Test',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Image.asset(
                  'assets/images/glucose/Fasting_blood_sugar_test.png',
                )),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Test History',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: FutureBuilder<List<FBST>>(
                    future: DatabaseHelper.instance.getFBST(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading...'));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No History'))
                          : ListView(
                              children: snapshot.data!.map((fbst) {
                              double w = double.parse(fbst.fbst);
                              if (w >= 126) {
                                bg = Colors.red;
                              } else if (w >= 100) {
                                bg = Colors.blue;
                              } else {
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          Text(
                                              fbst.result +
                                                  ' ' +
                                                  fbst.fbst +
                                                  '\n' +
                                                  fbst.date,
                                              style: TextStyle(fontSize: 15)),
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
                                                        _fbstController.text =
                                                            fbst.fbst;

                                                        selectedId = fbst.id;

                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                  content:
                                                                      Container(
                                                                          height:
                                                                              100,
                                                                          child:
                                                                              Form(
                                                                            key:
                                                                                _key,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Container(
                                                                                  child: TextFormField(
                                                                                    controller: _fbstController,
                                                                                    decoration: InputDecoration(
                                                                                      border: OutlineInputBorder(),
                                                                                      hintText: 'Enter Test',
                                                                                    ),
                                                                                    validator: (value) {
                                                                                      if (value!.isEmpty) {
                                                                                        return 'Enter Fasting Blood Sugar';
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
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return AlertDialog(
                                                                                  content: Text('Do you want to edit this record?'),
                                                                                  actions: <Widget>[
                                                                                    TextButton(
                                                                                        onPressed: () {
                                                                                          setState(() {
                                                                                            double w = double.parse(_fbstController.text);

                                                                                            if (w >= 126) {
                                                                                              result = "Diabetes";
                                                                                            } else if (w >= 100) {
                                                                                              result = "PreDiabetes";
                                                                                            } else {
                                                                                              result = "Normal";
                                                                                            }

                                                                                            DatabaseHelper.instance.updateFBST(FBST(id: selectedId, result: result, fbst: _fbstController.text, date: date));
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
                                                                            DatabaseHelper.instance.deleteFBST(fbst.id!);
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
                                    )),
                              );
                            }).toList());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          dialogbox(context);
          _fbstController.clear();
        },
      ),
    );
  }
}
