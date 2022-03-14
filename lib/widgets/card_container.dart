import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double padding;
  
  const CardContainer({Key? key, required this.child, required this.height, required this.width, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height, //TODO: BORRAR
      decoration: _crearCardShape(),
      child: Center(child: child),
    );
  }

  BoxDecoration _crearCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 7,
                offset: Offset(
                  0,
                  0,
                ))
          ]);
}
