import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/widgets/text.dart';

class telaperfil3 extends StatelessWidget {
  const telaperfil3 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          FlutterLogo(size: 200),
                          SizedBox(height: 20),
                          Textos("NOME 3"),
                          Textos('TELEFONE: 0000 - 0000 ')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child:  Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(color: Colors.white,
                    child: Textos('ESCOLAS'),
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
