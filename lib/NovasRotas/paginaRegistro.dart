import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_final/widgets/widgetsGeral.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.teal),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                'Modo de Cadastro',
                textScaleFactor: 2.5,
              ),
              const SizedBox(
                height: 60,
              ),
              materialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/aluno');
                  },
                  text: 'Aluno'),
              const SizedBox(
                height: 8,
              ),
              materialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/motorista');
                  },
                  text: 'Motorista'),
              const SizedBox(
                height: 8,
              ),
              materialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastroRotas');
                  },
                  text: 'Rotas'),
            ],
          ),
        ),
      ),
    );
  }
}
