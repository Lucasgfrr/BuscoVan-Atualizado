// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/NovasRotas/pesquisa.dart';
import 'package:projeto_final/NovasRotas/telalogin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginWidget(onClickedSignUp: toggle) : Pesquisa();

  void toggle() => setState(() => isLogin = !isLogin);
}

userAlunoRegister(
  BuildContext context, {
  required email,
  required password,
}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then(
        (value) => Navigator.of(context).pushReplacementNamed('/'),
      );
}

userMotoristaRegister(
  BuildContext context, {
  required email,
  required password,
}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then(
        (value) => Navigator.of(context).pushReplacementNamed('/'),
      );
}
