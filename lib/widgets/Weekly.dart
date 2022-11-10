// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class Aboutt extends StatefulWidget {
  const Aboutt({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<Aboutt> {
  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  final shape = StadiumBorder();
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 600,
                child: FutureBuilder<List<Summary>>(
                  future: DatabaseHelper.instance.getSumm(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: Text('Loading...'));
                    }
                    return snapshot.data!.isEmpty
                        ? Center(child: Text('No Weekly Summary'))
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
                                        exe.summary,
                                        style: GoogleFonts.libreBaskerville(
                                          textStyle: style,
                                          fontSize: 12.0,
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
                                                "Do you want to delete this Weekly Summary",
                                            confirmButtonText: "Confirm",
                                            cancelButtonText: "Cancel",
                                            onTapCancel: () {
                                              Navigator.pop(context);
                                            },
                                            onTapConfirm: () {
                                              setState(() {
                                                            DatabaseHelper
                                                                .instance
                                                                .deletesumm(
                                                                    exe.id!);
                                                          });
                                              Navigator.pop(context);
                                            },
                                            panaraDialogType:
                                                PanaraDialogType.normal,
                                          );
                                        },
                                        icon: Icon(Icons.delete),
                                        label: Text('')),
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

