import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja/pages/produto_lista.dart';
import 'package:loja/pages/registro.dart';

class Entrar extends StatefulWidget {
  @override
  _EntrarState createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var _email = '';
  var _senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entrar')),
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
              RaisedButton(onPressed: _entrar, child: Text('Entrar')),
              Padding(padding: EdgeInsets.all(8)),
              FlatButton(onPressed: _goToRegister, child: Text('Registrar-se')),
            ],
          ),
        ),
      ),
    );
  }

  _goToRegister() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Registro()));
  }

  _entrar() async {
    _form.currentState.save();

    try {
      await _auth.signInWithEmailAndPassword(email: _email, password: _senha);
      Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => ProdutoLista()));
    } catch (e) {
      print(e);
    }
  }
}

class Regitro {}
