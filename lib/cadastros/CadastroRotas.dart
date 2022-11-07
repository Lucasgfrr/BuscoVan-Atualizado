import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_final/widgets/widgetsGeral.dart';
import 'package:uuid/uuid.dart';

class CadastroRotas extends StatefulWidget {
  const CadastroRotas({super.key});

  @override
  State<CadastroRotas> createState() => _CadastroRotasState();
}

class _CadastroRotasState extends State<CadastroRotas> {
  // instancia do firebase
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController _pontoAController = TextEditingController();
  TextEditingController _pontoBController = TextEditingController();

  List<String> listNames = [];

  void initState() {
    //Atualização Inicial
    //Atualização em Tempo real
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //FIREBASE
    final CollectionReference rotas =
        FirebaseFirestore.instance.collection('rotas');

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Cadastrar Rotas',
                  textScaleFactor: 2.5,
                ),
                textFormField(
                  controller: _pontoAController,
                  labletext: 'Ponto A',
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                  controller: _pontoBController,
                  labletext: 'Ponto B',
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 8,
                ),
                materialButton(onPressed: () => sendData(), text: 'Inserir'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendData() {
    //Gerar ID
    String id = Uuid().v1();
    db.collection('motorista').doc(id).collection('rotas');

    //feedback visual
    _pontoAController.text = '';
    _pontoBController.text = '';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Inserido com Sucesso"),
      ),
    );
  }
}
