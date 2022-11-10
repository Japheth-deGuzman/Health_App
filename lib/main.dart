// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_app/screens/homepage/homepage.dart';
import 'package:health_app/screens/homepage/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<List>("summary");
  await Hive.openBox<List>("summaryy");
  await Hive.openBox<int>("huhu");
  await Hive.openBox<int>("huhuh");
  await Hive.openBox<int>("first");
  await Hive.openBox<int>("last");
  await Hive.openBox<int>("temp_first");
  await Hive.openBox<int>("temp_last");
  await Hive.openBox<String>("datee");
  await Hive.openBox<int>("min");
  await Hive.openBox<int>("temp");


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        duration: 3,
        goToPage: HomePage(),
      ),
    );
  }
}
