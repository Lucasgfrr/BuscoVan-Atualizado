import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_final/NovasRotas/telalogin.dart';
import 'package:projeto_final/widgets/widgetsGeral.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Pesquisar'),
            onChanged: (val) {
              setState(() {});
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: materialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/p1');
                    },
                    text: 'Visualizar'),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
