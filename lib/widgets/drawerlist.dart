import 'package:flutter/material.dart';
import 'package:health_app/screens/create_acc/account.dart';
import 'package:health_app/widgets/history.dart';
import 'package:health_app/widgets/header_drawer.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
          child: ListView(
            padding: padding,
            children: [
              HeaderDrawer(),
              Divider(
                color: Colors.black,
              ),
              buildMenuItem(
                text: 'Profile',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 1),
              ),
              buildMenuItem(
                text: 'Exercise History',
                icon: Icons.history,
                onClicked: () => selectedItem(context, 2),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Account(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => History(),
        ));
        break;
    }
  }
}
