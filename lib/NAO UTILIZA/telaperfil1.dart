import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/widgets/text.dart';

class telaperfil1 extends StatelessWidget {
  const telaperfil1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Textos("NAME TEST"),
                          Textos('TELEFONE: 4002 - 8922 '),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Textos('Escolas'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Textos('Carregando....'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
