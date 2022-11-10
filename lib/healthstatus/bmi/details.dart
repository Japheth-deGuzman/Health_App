import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String bmi;
  final String weight;
  final String height;
  final String result;
  final String date;

  DetailsPage({
    required this.bmi,
    required this.weight,
    required this.height,
    required this.result,
    required this.date,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Color bg;
  @override
  Widget build(BuildContext context) {
    double bmi = double.parse('${widget.bmi}');
    if (bmi >= 30) {
      bg = Colors.red;
    } else if (bmi >= 25) {
      bg = Colors.orange;
    } else if (bmi >= 18.5) {
      bg = Colors.green;
    } else {
      bg = Colors.blue;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' BMI Details',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: bg,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '${widget.result}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Table(
                  children: [
                    TableRow(children: [
                      Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'BMI',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Text(
                          ': ${widget.bmi}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'Weight',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Text(
                          ': ${widget.weight}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'Height',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Text(
                          ': ${widget.height}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'Date',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Text(
                          ':${widget.date}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ])
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
