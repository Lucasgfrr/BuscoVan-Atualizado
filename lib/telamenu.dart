// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/NovasRotas/motorista_model.dart';
import 'package:projeto_final/NovasRotas/motoristaperfil.dart';

class TelaMenu extends StatefulWidget {
  const TelaMenu({super.key});

  @override
  State<TelaMenu> createState() => _TelaMenuState();
}

TextEditingController _pesquisaController = TextEditingController();
FirebaseFirestore db = FirebaseFirestore.instance;

class _TelaMenuState extends State<TelaMenu> {
  List<RotasModel> resultadoPesquisa = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance.collection('rotas').get();

    setState(() {
      List listaLocal = result.docs.map((e) => e.data()).toList();
      for (var item in listaLocal) {
        resultadoPesquisa.add(RotasModel.fromMap(item));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
              controller: _pesquisaController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pesquisar',
              ),
              onChanged: (query) {
                searchFromFirebase(query);
              }),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(15.0)),
          Expanded(
            child: ListView.builder(
                itemCount: resultadoPesquisa.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(resultadoPesquisa[index].rotaA),
                    subtitle: Text(resultadoPesquisa[index].nomeCompleto),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MotoristaPerfil(
                          rotas: resultadoPesquisa[index],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
