import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:galve/model/bando.dart';
import 'package:http/http.dart' as http;

class BandosService extends ChangeNotifier {
  final String _baseUrl =
      "galveinforma-default-rtdb.europe-west1.firebasedatabase.app";

  late List<Bando> bandos = [];
  late Bando selectedBando;

  bool isLoading = true;

  BandosService() {
    this.cargarBandos();
  }

  Future cargarBandos() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'bandos.json');
    final resp = await http.get(url);
    //Nos da una respuesta cuyo body va en un string que viene como un json. Debemos convertilo en un mapa de nuestros productos!
    final Map<String, dynamic> bandosMap = json.decode(resp.body);

    bandosMap.forEach((key, value) {
      final Bando tmpBando = Bando.fromMap(value);
      tmpBando.id = key;
      bandos.add(tmpBando);
    });
    isLoading = false;
    notifyListeners();
  }

  void selectBandoPorIndex(int index) {
    selectedBando = bandos[index];
  }
}
