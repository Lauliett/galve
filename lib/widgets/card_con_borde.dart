import 'package:flutter/material.dart';

class CardConBorde extends StatelessWidget {
  final Widget child;

  const CardConBorde({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: child,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            width: 2.0, color: const Color.fromRGBO(233, 239, 247, 1.0)),
      ),
    );
  }
}
