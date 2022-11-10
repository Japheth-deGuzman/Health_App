import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/acc/main.png'),
              ),
            ),
          ),
          Text(
            'Health App',
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
