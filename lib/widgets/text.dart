import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  String seutexto;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.seutexto,
      style: const TextStyle(
          fontSize: 20, color: Colors.black, backgroundColor: Colors.white),
    );
  }
  Textos(this.seutexto);
}

