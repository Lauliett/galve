import 'package:flutter/material.dart';

class AppTheme {
  static const Color lilaOscuro = Color.fromRGBO(15, 17, 68, 1.0);

  static const lilaPrimario = Color.fromRGBO(101, 102, 201, 1.0);
  static const lilaSegundoClaro = Color.fromRGBO(125, 103, 249, 1.0);

  static const Color textColorDark = Color.fromRGBO(58, 68, 77, 1.0);
  static const Color verde = Color.fromRGBO(50, 211, 117, 1.0);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: verde, elevation: 0, shape: const StadiumBorder())),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: textColorDark),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: lilaOscuro)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: verde),
      ),
    ),
    iconTheme: const IconThemeData(color: lilaOscuro),
  );
}
