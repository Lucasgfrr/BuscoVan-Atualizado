import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class MotoristaSignUp extends StatefulWidget {
  final Function() onClickedSignIn;

  const MotoristaSignUp({
    Key? key,
    required this.onClickedSignIn,
  }) : super (key: key);

  @override
  State<MotoristaSignUp> createState() => _MotoristaSignUpState();
}

class _MotoristaSignUpState extends State<MotoristaSignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 60),
        FlutterLogo(size: 120),
        SizedBox(height: 20),
        Text(
          "BEM VINDO MOTORISTA",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 4),
        TextField(
          controller: passwordController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Senha'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
          icon: Icon(Icons.arrow_forward, size: 32),
          label: Text(
            'Cadastrar',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: signUp,
        ),
        SizedBox(height: 20),
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white,fontSize: 24),
              text: 'Ja tem conta ? ',
              children: [
                TextSpan(recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignIn,
                  text: 'Entrar',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary
                  ),
                ),
              ]
          ),
        ),
      ],
    ),
  );

  Future signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }on FirebaseAuthException catch (e){
      print(e);
    }
  }
}
