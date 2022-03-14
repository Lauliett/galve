import 'package:flutter/material.dart';

class CardConFondo extends StatelessWidget {
  final Widget child;
  final ImageProvider<Object> imagen;
  final Color color;

  const CardConFondo({
    Key? key,
    required this.child,
    required this.imagen,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: child,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          image: DecorationImage(image: imagen, fit: BoxFit.cover)),
    );
  }
}
