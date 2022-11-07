// ignore_for_file: prefer_const_constructors, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/cadastros/CadastroAluno.dart';
import 'package:projeto_final/cadastros/CadastroMotorista.dart';
import 'package:projeto_final/cadastros/CadastroRotas.dart';
import 'package:projeto_final/telamenu.dart';
import 'BD/authpage.dart';
import 'NAO UTILIZA/telaperfil1.dart';
import 'NovasRotas/paginaRegistro.dart';
import 'NovasRotas/pesquisa.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
      routes: {
        //'/': (context) =>  const HomePage(),
        //'/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/aluno': (context) => AlunoCadastro(),
        '/motorista': (context) => MotoristaCadastro(),
        '/pesquisa': (context) => Pesquisa(),
        '/telaprincipal': (context) => TelaMenu(),
        '/cadastroRotas': (context) => CadastroRotas(),
      },
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("TENTE NOVAMENTE"));
            } else if (snapshot.hasData) {
              return TelaMenu();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}
