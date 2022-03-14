import 'package:flutter/material.dart';
import 'package:galve/model/bando.dart';

class BandoCard extends StatelessWidget {
  final Bando bando;

  const BandoCard({Key? key, required this.bando}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
              leading: Icon(
                Icons.date_range_outlined,
                color: Colors.greenAccent.shade700,
              ),
              title: Text(bando.tituloBando),
              subtitle: bando.descripcion.length > 50
                  ? Text(bando.descripcion.substring(0, 49))
                  : Text(bando.descripcion))
        ],
      ),
    );
  }
}
