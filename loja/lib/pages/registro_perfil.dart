import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja/models/perfil_model.dart';
import 'package:loja/services/perfil_service.dart';

import 'produto_lista.dart';

class RegistroPerfil extends StatefulWidget {
  @override
  _RegistroPerfilState createState() => _RegistroPerfilState();
}

class _RegistroPerfilState extends State<RegistroPerfil> {
  final _form = GlobalKey<FormState>();
  var _perfil = PerfilModel();
  final _auth = FirebaseAuth.instance;
  final _service = PerfilService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => _perfil.nome = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Data de nascimento'),
                  onSaved: (value) => _perfil.dataDeNascimento = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Telefone'),
                  onSaved: (value) => _perfil.telefone = value,
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(onPressed: _salvar, child: Text('Entrar')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _salvar() async {
    _form.currentState.save();
    _perfil.uid = (await _auth.currentUser()).uid;

    try {
      final perfil = await _service.criarPerfil(_perfil);
      print(perfil);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => ProdutoLista()));
    } catch (e) {
      print(e);
    }

  }
}