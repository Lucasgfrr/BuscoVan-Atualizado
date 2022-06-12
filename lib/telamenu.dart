
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/NAO%20UTILIZA/telaperfil1.dart';
import 'package:projeto_final/NAO%20UTILIZA/telaperfil2.dart';
import 'package:projeto_final/NAO%20UTILIZA/telaperfil3.dart';

class TelaMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
    appBar: AppBar(
    title: Text("PESQUISAR"),
      backgroundColor: Colors.blue,
    ),
    body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Motorista 1'),
              onTap: () => {_clickMotorista01(context, telaperfil1())},

            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Motorista 2'),
              onTap: () => {_clickMotorista01(context, telaperfil2())},
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Motorista 3'),
              onTap: () => {_clickMotorista01(context, telaperfil3())},
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.arrow_back,size: 32),
              label: Text(
                "SAIR",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
    );

  }



  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  void _clickMotorista01(BuildContext ctx, page) {
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}


