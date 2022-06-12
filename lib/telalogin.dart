import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/cadastros/telacadastroaluno.dart';
import 'cadastros/cadastromotorista.dart';
import 'main.dart';


class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({
    Key ? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override

  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BUSCO VAN"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: emailController,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    controller: passwordController,
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                ButtonTheme(
                  height: 10.0,
                  child: RaisedButton(
                    onPressed: singIn,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Divider(),
                SizedBox(height: 24),
            RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  text: 'Sem conta ? ',
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: "Cadastrar",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    ),
                  ]
              ),
            ),


                SizedBox(height: 24),
                ButtonTheme(
                  height: 10.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: RaisedButton(
                    onPressed: () =>
                    {_abreoutratela(context, MotoristaSignUp(onClickedSignIn: () {  },))},
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      "Cadastrar Motorista",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 24),

              ],
            ),
          ),
        ));
  }

  Future singIn() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

void _abreoutratela(BuildContext ctx, page) {
  Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}
