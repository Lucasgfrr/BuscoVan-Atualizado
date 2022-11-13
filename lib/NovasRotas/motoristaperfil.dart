import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_final/NovasRotas/motorista_model.dart';

class MotoristaPerfil extends StatelessWidget {
  final RotasModel rotas;
  const MotoristaPerfil({super.key, required this.rotas});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(rotas.nomeCompleto),
    );
  }
}
