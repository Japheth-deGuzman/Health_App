// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class Hestory extends StatefulWidget {
  const Hestory({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<Hestory> {
  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  final shape = StadiumBorder();
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Container(
                height: 600,
                child: FutureBuilder<List<Exercise>>(
                  future: DatabaseHelper.instance.getEx(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: Text('Loading...'));
                    }
                    return snapshot.data!.isEmpty
                        ? Center(child: Text('No History'))
                        : ListView(
                            children: snapshot.data!.map((exe) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15),
                              child: Container(
                                decoration: ShapeDecoration(
                                    shape: shape,
                                    gradient: LinearGradient(colors: [
                                      Colors.lightBlue.shade400,
                                      Colors.greenAccent.shade100,
                                    ])),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        'Exercise: '+
                                        exe.exercise +
                                            '\n' +
                                            'Time: ' +
                                            exe.time +
                                            ' : ' +
                                            exe.secs +
                                            '\n' +
                                            'Date: '+
                                            exe.date,
                                        style: GoogleFonts.libreBaskerville(
                                          textStyle: style,
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),

                                    TextButton.icon(
                                        onPressed: () {
                                          PanaraConfirmDialog.showAnimatedGrow(
                                            context,
                                            title: "Are You Sure",
                                            message:
                                                "Do you want to delete this.",
                                            confirmButtonText: "Confirm",
                                            cancelButtonText: "Cancel",
                                            onTapCancel: () {
                                              Navigator.pop(context);
                                            },
                                            onTapConfirm: () {
                                              setState(() {
                                                DatabaseHelper.instance
                                                    .deleteexe(exe.id!);
                                              });
                                              Navigator.pop(context);
                                            },
                                            panaraDialogType:
                                                PanaraDialogType.normal,
                                          );
                                        },
                                        icon: Icon(Icons.delete),
                                        label: Text('')),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
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
  );



  
}
