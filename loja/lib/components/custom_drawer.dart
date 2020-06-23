import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja/pages/entrar.dart';
import 'package:loja/pages/tarefas.dart';
import 'package:loja/pages/teste_mobx.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: FutureBuilder<FirebaseUser>(
              future: FirebaseAuth.instance.currentUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Text(snapshot.data.email);
                else
                  return Text('carregando...');
              },
            ),
          ),
          ListTile(title: Text('Teste'), onTap: () => _goTo(context, TexteMobx())),
          ListTile(title: Text('Tateras'), onTap: () => _goTo(context, Tarefas())),
          Spacer(),
          FlatButton.icon(
            onPressed: () => _sair(context),
            icon: Icon(Icons.exit_to_app),
            label: Text('Sair'),
          )
        ],
      ),
    );
  }

  _sair(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Entrar()));
  }

  _goTo(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
