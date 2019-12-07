import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Início"),
            ),
            ListTile(
              title: Text("Em alta"),
            ),
            ListTile(
              title: Text("Inscriçōes"),
            ),
            ListTile(
              title: Text("Originals"),
            ),
          ],
        ),
      ),
    );
  }
}
