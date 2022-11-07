import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_final/widgets/widgetsGeral.dart';
import 'package:uuid/uuid.dart';

class AlunoCadastro extends StatelessWidget {
  AlunoCadastro({super.key});

  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _ultimo_nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numeroCelController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  List<String> listNames = [];

  BuildContext get contexte => contexte;

  void initState() {
    //Atualização Inicial
    //Atualização em Tempo real
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //FIREBASE
    final CollectionReference _alunos =
        FirebaseFirestore.instance.collection('alunos');

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
                GestureDetector(
                  child: Container(
                    width: 250,
                    child: Lottie.asset(
                      'lottie/5450-my-children.json',
                      animate: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Cadastrar Aluno',
                  textScaleFactor: 2.5,
                ),
                textFormField(
                    controller: _nomeController,
                    labletext: 'Nome',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                    controller: _ultimo_nomeController,
                    labletext: 'Ultimo Nome',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                    controller: _cpfController,
                    labletext: 'CPF',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                    controller: _numeroCelController,
                    labletext: 'Celular',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                    controller: _emailController,
                    labletext: 'Email',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                  controller: _passwordController,
                  labletext: 'Senha',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 8,
                ),
                textFormField(
                    controller: _confirmPasswordController,
                    labletext: 'Confirmar Senha',
                    obscureText: true,
                    textInputAction: TextInputAction.done),
                const SizedBox(
                  height: 8,
                ),
                materialButton(
                  onPressed: () => sendData(),
                  text: 'Cadastrar',
                ),
                const SizedBox(
                  height: 8,
                ),
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
    db.collection('alunos').doc(id).set(
      {
        'nome': _nomeController.text,
        'ultimoNome': _ultimo_nomeController.text,
        'email': _emailController.text,
        'cpf': _cpfController.text,
        'numeroCelular': _numeroCelController.text,
        'senha': _passwordController.text,
      },
    );

    //feedback visual
    _nomeController.text = '';
    _ultimo_nomeController.text = '';
    _emailController.text = '';
    _cpfController.text = '';
    _numeroCelController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    ScaffoldMessenger.of(contexte).showSnackBar(
      SnackBar(
        content: Text('Salvo com Sucesso'),
      ),
    );
  }
}
