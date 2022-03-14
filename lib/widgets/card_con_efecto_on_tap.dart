import 'package:flutter/material.dart';

class CardConEfectoOnTap extends StatelessWidget {
  final Function onTap;
  final Widget children;

  const CardConEfectoOnTap({
    Key? key,
    required this.onTap,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            child: children,
            decoration: BoxDecoration(),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 7,
                offset: Offset(
                  0,
                  0,
                ))
          ]),
    );
  }
}
