import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja/pages/produto_lista.dart';
import 'package:loja/pages/registro_perfil.dart';

import 'entrar.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var _email = '';
  var _senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Registro')),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _email = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  onSaved: (value) => _senha = value,
                ),
                 Padding(padding: EdgeInsets.all(8)),
                RaisedButton(onPressed: _entrar, child: Text('Registrar-se')),
                Padding(padding: EdgeInsets.all(8)),
                FlatButton(
                    onPressed: _goToRegister, child: Text('Entrar')),
              ],
            ),
          ),
        ));
  }

  _goToRegister() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Entrar()));
  }

  _entrar() async {
    _form.currentState.save();

    try {
      await _auth.createUserWithEmailAndPassword(email: _email, password: _senha);
      Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => RegistroPerfil()));
    } catch (e) {
      print(e);
    }
  }
}
