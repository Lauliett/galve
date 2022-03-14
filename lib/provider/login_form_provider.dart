import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //Con esto obtenemos una referencia a nuestro formulario!
  //Esto me mesta resultando un poco rarico.
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
