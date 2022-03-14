import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixicon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String initialValue;

  final String formPropierty;

  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixicon,
    this.keyboardType,
    this.obscureText = false,
    required this.formPropierty,
    required this.formValues,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obscureText,
      keyboardType: keyboardType,
      initialValue: initialValue,
      //onChanged sirve para capturar el valor que introducimos
      onChanged: (valor) => formValues[formPropierty] = valor,
      validator: (valor) {
        if (valor == null) return 'Este campo es requerido';
        return valor.length < 3 ? 'Mínimo de tres letras' : null;
      },

      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: Icon(suffixicon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
