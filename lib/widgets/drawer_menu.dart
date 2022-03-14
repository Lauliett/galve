import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 20,
            color: Color.fromRGBO(15, 17, 68, 1.0),
          ),
          ListTile(
            title: Text("Acceso administrador"),
            onTap: () {
              Navigator.pushNamed(context, "login");
            },
          ),
          ListTile(
            title: Text("Acerda de"),
          )
        ],
      ),
    );
  }
}
