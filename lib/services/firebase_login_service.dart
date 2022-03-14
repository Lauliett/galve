import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

//Si, me he comprado el curso de udemy de fernando herrera jajajajajajajajjajajajajajaja :)
//Pero no es un copia y pega sin mas, es  un copia segun el video<
class FirebaseLoginService extends ChangeNotifier {
  //_ == privado!
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBDiUwVFZDpkaSwmDzLvEa77nEolHUcWs0';

  final almacenamiento = new FlutterSecureStorage();

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      //token hay que guardarlo en un lugar seguro
      await almacenamiento.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

//Si retoramos algo es un error, si noes bien!
  Future<String?> crearUsuario(String email, String password) async {
    //Para mandar información a un post, necesitamos mandarlo como un mapa!
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.http(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    //Significa que login es bien!
    if (decodedResp.containsKey('idToken')) {
      //token hay que guardarlo en un lugar seguro
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await almacenamiento.delete(key: 'token');
  }

  Future<String> leerToken() async {
    return await almacenamiento.read(key: 'token') ?? '';
  }
}
