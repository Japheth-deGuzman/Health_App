import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:intl/intl.dart';

class RandomBloodSugar extends StatefulWidget {
  const RandomBloodSugar({Key? key}) : super(key: key);
  @override
  _RandomBloodSugarState createState() => _RandomBloodSugarState();
}

class _RandomBloodSugarState extends State<RandomBloodSugar> {
  late Color bg;
  var rBST;
  var selectedId;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _rbstController = TextEditingController();
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
                            controller: _rbstController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Test',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Random Blood Sugar';
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
                          double w = double.parse(_rbstController.text);

                          if (w >= 200) {
                            result = "Diabetes";
                          } else {
                            result = "Normal";
                          }

                          DatabaseHelper.instance.addRBST(RBST(
                              result: result,
                              rbst: _rbstController.text,
                              date: date));
                        });
                        Navigator.of(context).pop();
                      }
                    })
              ]);
        });
  }

  Future<void> dialogboxedit(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                  height: 100,
                  child: Form(
                    key: _key,
                    child: Container(
                      child: TextFormField(
                        controller: _rbstController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Test',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Random Blood Sugar';
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
                  )),
              actions: <Widget>[
                TextButton(
                    child: Text('Edit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Do you want to edit?'),
                              actions: [
                                TextButton(
                                  child: Text('Edit'),
                                  onPressed: () {
                                    setState(() {
                                      double w =
                                          double.parse(_rbstController.text);

                                      if (w >= 200) {
                                        result = "Diabetes";
                                      } else {
                                        result = "Normal";
                                      }

                                      DatabaseHelper.instance.updateRBST(RBST(
                                          id: selectedId,
                                          result: result,
                                          rbst: _rbstController.text,
                                          date: date));
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                TextButton(
                                  child: Text('Canel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    })
              ]);
        });
  }

  Future<void> dialogboxdelete(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Text('Do you want to delete?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Delete'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      DatabaseHelper.instance.deleteRBST(selectedId);
                    });
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Blood Sugar Test',
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
                  'assets/images/glucose/Random_blood_sugar_test.png',
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
                  child: FutureBuilder<List<RBST>>(
                    future: DatabaseHelper.instance.getRBST(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading...'));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No History'))
                          : ListView(
                              children: snapshot.data!.map((rbst) {
                              double w = double.parse(rbst.rbst);
                              if (w >= 200) {
                                bg = Colors.red;
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
                                            rbst.result +
                                                ' ' +
                                                rbst.rbst +
                                                '\n' +
                                                rbst.date,
                                            style: TextStyle(fontSize: 15)),
                                        Expanded(child: Container()),
                                        PopupMenuButton(
                                            itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                      child: ListTile(
                                                          title: Text('Edit'),
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            selectedId =
                                                                rbst.id;
                                                            dialogboxedit(
                                                                context);
                                                            _rbstController
                                                                    .text =
                                                                rbst.rbst;
                                                          })),
                                                  PopupMenuItem(
                                                      child: ListTile(
                                                    title: Text('Delete'),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      selectedId = rbst.id;
                                                      dialogboxdelete(context);
                                                    },
                                                  )),
                                                ]),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  // Card(
                                  //   child: ListTile(
                                  //     title: Text(
                                  //       rbst.result + ' ' + rbst.rbst,
                                  //       style: TextStyle(fontSize: 20),
                                  //     ),
                                  //     subtitle: Text(rbst.date),
                                  //     onTap: () {},
                                  //     trailing: PopupMenuButton(
                                  //         itemBuilder: (context) => [
                                  //               PopupMenuItem(
                                  //                   child: ListTile(
                                  //                       title: Text('Edit'),
                                  //                       onTap: () {
                                  //                         Navigator.of(context)
                                  //                             .pop();
                                  //                         selectedId = rbst.id;
                                  //                         dialogboxedit(context);
                                  //                         _rbstController.text =
                                  //                             rbst.rbst;
                                  //                       })),
                                  //               PopupMenuItem(
                                  //                   child: ListTile(
                                  //                 title: Text('Delete'),
                                  //                 onTap: () {
                                  //                   Navigator.of(context).pop();
                                  //                   selectedId = rbst.id;
                                  //                   dialogboxdelete(context);
                                  //                 },
                                  //               )),
                                  //             ]),
                                  //   ),
                                  // )
                                  ;
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
          _rbstController.clear();
        },
      ),
    );
  }
}
