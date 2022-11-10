// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:health_app/screens/create_acc/account.dart';
import 'package:health_app/screens/homepage/exercise.dart';
import 'package:health_app/screens/homepage/about.dart';
import 'package:health_app/widgets/history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = [
  Exercise(),  
  Account(),
    
    History(),
    About(),
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentindex],
        bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 15),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                onTap: (index) => setState(() => currentindex = index),
                currentIndex: currentindex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.lightBlue[600],
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(.70),
                selectedFontSize: 14,
                unselectedFontSize: 14,
                items: [
              
                  BottomNavigationBarItem(
                      icon: Icon(Icons.self_improvement_rounded),
                      label: 'Exercise'),
                          BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history_sharp), label: 'History'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.info), label: 'about'),
                ],
              ),
            )));
  }
}
