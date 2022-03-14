import 'package:flutter/material.dart';

//No necesita dibujar nada. Por eso no tiene un notify changer
class NotificationsService {
  //Cuando necesitamos mantener el estado de una llave, es cuando lleva el state!
  //Esta llave nos sirve para mantener la referencia a un widget muy importante
  //que es nuestro materialapp. Este material app tiene un scaffold de messenger o alg oasí.
  //La otra forma que había encontrado esta deprecated, y lo está porque nos dice
  //que puede haber un snackbar ya mostrándose!!. Creo que por eso necesitamos esta referencia! :)
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String mensaje) {
    final snackBar = SnackBar(content: Text(mensaje));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
