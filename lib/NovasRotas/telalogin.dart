// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  //ANIMAÇÃOOO
  late final AnimationController _controller;
  bool checked = false;

  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(microseconds: 100);
  }

  toggle() {
    (!checked) ? _controller.forward() : _controller.reverse();
    checked = !checked;
  }

  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "BUSCO VAN",
          selectionColor: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: toggle(),
                  child: Container(
                    width: 100,
                    child: Lottie.asset(
                      'lottie/10582-van.json',
                      controller: _controller,
                      animate: true,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                TextField(
                  controller: emailController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  decoration: InputDecoration(
                    labelText: "Login",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 15),
                materialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          '/telaprincipal'); //estava na telaPrincipal
                    },
                    text: 'Login'),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text('Não tem uma conta ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text('Registrar'),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  materialButton({required onPressed, required text}) {
    return Material(
      elevation: 2,
      shadowColor: Colors.black,
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.teal,
        minWidth: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textScaleFactor: 1.2,
          ),
        ),
      ),
    );
  }
}
