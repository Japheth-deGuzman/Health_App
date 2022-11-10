// ignore_for_file: unused_local_variable, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:health_app/db/dbhealthapp.dart';
import 'package:health_app/db/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:health_app/healthstatus/blood_pressure.dart';
// import 'package:health_app/healthstatus/bmi/bmi.dart';
// import 'package:health_app/healthstatus/glucose/blood_glucoes.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:intl/intl.dart';
import 'package:health_app/screens/homepage/homepage.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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

  final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final styl = TextStyle(fontSize: 11);
  late Box<List> summary;
  late Box<int> huhu;
  late Box<int> min;
  late Box<int> first;
  late Box<int> last;
  late Box<String> datee;
  late Box<int> temp_first;
  late Box<int> temp_last;

  final namecon = TextEditingController();
  final agecon = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    summary = Hive.box<List>("summary");
    huhu = Hive.box<int>("huhu");
    min = Hive.box<int>("min");
    first = Hive.box<int>("first");
    last = Hive.box<int>("last");
    datee = Hive.box<String>("datee");
    temp_first = Hive.box<int>("temp_first");
    temp_last = Hive.box<int>("temp_last");
  }

  final stylee = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  final shape = StadiumBorder();
  @override
  Widget build(BuildContext context) {
    if (huhu.isEmpty) {
      huhu.add(0);
    }
    if (min.isEmpty) {
      min.add(0);
    }
    if (datee.isEmpty) {
      datee.add('No Exercise');
    }
    var uhh = datee.valuesBetween();
    var fdf = uhh.last;

    var pinal = huhu.valuesBetween();
    var pinale = pinal.last;

    var lk = min.valuesBetween();
    var minu = lk.last;

    return Scaffold(
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  color: Colors.transparent,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'My Profile',
                    style: GoogleFonts.libreBaskerville(
                      textStyle: style,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ), //Text
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        // border: Border.all(width: 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    margin: EdgeInsets.all(1),
                    child: FutureBuilder<List<Profile>>(
                      future: DatabaseHelper.instance.getprofile(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Profile>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: Text('Loading...'));
                        }
                        return snapshot.data!.isEmpty
                            ? Center(
                                child: Container(
                                padding:
                                    EdgeInsets.only(left: 20.0, right: 20.0),
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.blue, 
                                    elevation: 0
                                  ),
                                  icon: Icon(Icons.add),
                                  label: Text('ADD PROFILE', style: GoogleFonts.libreBaskerville(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue
                    ),),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Form(
                                              key: _key,
                                              child: AlertDialog(
                                                content: Container(
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        controller: namecon,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .words,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'Name'),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Enter Name';
                                                          }
                                                          String pattern =
                                                              r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]';
                                                          RegExp regexp =
                                                              RegExp(pattern);
                                                          if (regexp.hasMatch(
                                                              value)) {
                                                            return 'Format not Correct';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        controller: agecon,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    'Age'),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Enter Age';
                                                          }
                                                          String patterna =
                                                              r'[!@#<>?":_`~;[\]\\|=+)(*&^%.]';
                                                          RegExp regexpa =
                                                              RegExp(patterna);
                                                          if (regexpa.hasMatch(
                                                              value)) {
                                                            return 'Format not Correct';
                                                          }
                                                          String pattern =
                                                              // r'^([1-9]|[01][0-9][0-9]|20[0-0])$';
                                                              r'^(?:(?:[1-9]?[0-9]|1[0-9]{2})(?:\.[0-9]{1,4})?|200(?:\.0{1,4})?)$';
                                                          RegExp regexp =
                                                              RegExp(pattern);
                                                          if (!regexp.hasMatch(
                                                              value)) {
                                                            return '1-200';
                                                          }
                                                          return null;
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                      child: Text('Save'),
                                                      onPressed: () {
                                                        if (_key.currentState!
                                                            .validate()) {
                                                          setState(() {
                                                            DatabaseHelper
                                                                .instance
                                                                .addprofile(Profile(
                                                                    name: namecon
                                                                        .text,
                                                                    age: agecon
                                                                        .text));
                                                            namecon.text = '';
                                                            agecon.text = '';
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                      })
                                                ],
                                              ));
                                        });
                                  },
                                ),
                              ))
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: snapshot.data!.map((profile) {
                                      return ListTile(
                                        title: Text(
                                          'Name:   ' +
                                              profile.name +
                                              '\n' +
                                              'Age:       ' +
                                              profile.age,
                                          style: GoogleFonts.libreBaskerville(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 18,
                                          ),
                                        ),
                                        trailing: PopupMenuButton(
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: ListTile(
                                                title: Text('Edit'),
                                                onTap: () {
                                                  namecon.text = profile.name;
                                                  agecon.text = profile.age;
                                                  Navigator.of(context).pop();
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Form(
                                                            key: _key,
                                                            child: AlertDialog(
                                                              content:
                                                                  Container(
                                                                height: 150,
                                                                child: Column(
                                                                  children: [
                                                                    TextFormField(
                                                                      controller:
                                                                          namecon,
                                                                      textCapitalization:
                                                                          TextCapitalization
                                                                              .words,
                                                                      decoration:
                                                                          InputDecoration(
                                                                              hintText: 'Name'),
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return 'Enter Name';
                                                                        }
                                                                        String
                                                                            pattern =
                                                                            r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]';
                                                                        RegExp
                                                                            regexp =
                                                                            RegExp(pattern);
                                                                        if (regexp
                                                                            .hasMatch(value)) {
                                                                          return 'Format not Correct';
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                                    TextFormField(
                                                                      controller:
                                                                          agecon,
                                                                      decoration:
                                                                          InputDecoration(
                                                                              hintText: 'Age'),
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return 'Enter Age';
                                                                        }
                                                                        String
                                                                            patterna =
                                                                            r'[!@#<>?":_`~;[\]\\|=+)(*&^%.]';
                                                                        RegExp
                                                                            regexpa =
                                                                            RegExp(patterna);
                                                                        if (regexpa
                                                                            .hasMatch(value)) {
                                                                          return 'Format not Correct';
                                                                        }
                                                                        String
                                                                            pattern =
                                                                            // r'^([1-9]|[01][0-9][0-9]|20[0-0])$';
                                                                            r'^(?:(?:[1-9]?[0-9]|1[0-9]{2})(?:\.[0-9]{1,4})?|200(?:\.0{1,4})?)$';
                                                                        RegExp
                                                                            regexp =
                                                                            RegExp(pattern);
                                                                        if (!regexp
                                                                            .hasMatch(value)) {
                                                                          return '1-200';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                    child: Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                       PanaraConfirmDialog
                                                      .showAnimatedGrow(
                                                    context,
                                                    title: "Are You Sure",
                                                    message:
                                                        "Do you want to edit your Profile.",
                                                    confirmButtonText:
                                                        "Confirm",
                                                    cancelButtonText: "Cancel",
                                                    onTapCancel: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    onTapConfirm: () {
                                                      setState(
                                                                            () {
                                                                          DatabaseHelper.instance.updateprofile(Profile(
                                                                              id: 1,
                                                                              name: namecon.text,
                                                                              age: agecon.text));
                                                                          namecon.text =
                                                                              '';
                                                                          agecon.text =
                                                                              '';
                                                                        });
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    panaraDialogType:
                                                        PanaraDialogType.normal,
                                                  );
                                                                        
                                                                      
                                                                    }),
                                                                TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Cancel',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20)))
                                                              ],
                                                            ));
                                                      });
                                                },
                                              ),
                                            ),
                                            PopupMenuItem(
                                              child: ListTile(
                                                title: Text('Delete'),
                                                onTap: () {
                                                  PanaraConfirmDialog
                                                      .showAnimatedGrow(
                                                    context,
                                                    title: "Are You Sure",
                                                    message:
                                                        "Do you want to delete your Profile.",
                                                    confirmButtonText:
                                                        "Confirm",
                                                    cancelButtonText: "Cancel",
                                                    onTapCancel: () {
                                                      Navigator.pop(context);
                                                    },
                                                    onTapConfirm: () {
                                                      setState(() {
                                                        DatabaseHelper.instance
                                                            .deleteprofile(
                                                                profile.id!);
                                                      });
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    panaraDialogType:
                                                        PanaraDialogType.normal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.lightBlue.shade400,
                        Colors.greenAccent.shade100,
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text(
                            'Exercise Weekly Summary',
                            style: GoogleFonts.libreBaskerville(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$fdf' +
                                  '\n' +
                                  'Time: ' +
                                  '$minu' +
                                  ' min ' +
                                  ' and ' +
                                  '$pinale' +
                                  ' sec ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.libreBaskerville(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  color: Colors.transparent,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'My BMI',
                    style: GoogleFonts.libreBaskerville(
                      textStyle: style,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ), //Text
                ),
                SizedBox(
                  height: 5,
                ),
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
                          ? Center(child: Text('No BMI History'))
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
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Container(
                                    height: 135,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: bg, width: 12),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                    margin: EdgeInsets.all(1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                              textStyle: styl,
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
                                                                              180,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          dialogbox(context);
          _weightController.clear();
          _heightController.clear();
        },
        label:  Text('ADD BMI', style: GoogleFonts.libreBaskerville(
          fontWeight: FontWeight.bold,
                    ),),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
