import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja/pages/produto_lista.dart';
import 'package:loja/pages/registro_perfil.dart';
import 'package:loja/services/perfil_service.dart';

import 'entrar.dart';

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  final _auth = FirebaseAuth.instance;
  final _service = PerfilService();

  @override
  void initState() {
    super.initState();
    _navegate();
  }

  _navegate() async {
    final user = await _auth.currentUser();

    if (user != null) {
      try {
        await _service.getPerfil(user.uid);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ProdutoLista(),
        ));
      } catch (e) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => RegistroPerfil(),
        ));
      }
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Entrar(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
