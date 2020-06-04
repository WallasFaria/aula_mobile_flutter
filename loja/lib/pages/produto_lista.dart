import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja/components/produto_card.dart';
import 'package:loja/models/produto_model.dart';
import 'package:loja/pages/produto_detalhes.dart';
import 'package:loja/pages/produto_form.dart';
import 'package:loja/services/firebase_produto_service.dart';

import 'entrar.dart';

class ProdutoLista extends StatefulWidget {
  @override
  _ProdutoListaState createState() => _ProdutoListaState();
}

class _ProdutoListaState extends State<ProdutoLista> {
  List<ProdutoModel> _produtos = [];
  final service = FirebaseProdutoService();
  final _auth = FirebaseAuth.instance;
  var _userEmail = '';

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
    _auth.currentUser().then((user) {
      setState(() => _userEmail = user.email);
    });
  }

  _carregarProdutos() async {
    final lista = await service.getProdutos();
    setState(() {
      _produtos = lista;
    });
  }

  _goToEdit(ProdutoModel produto) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoForm(produto: produto);
    })).then((atualizar) {
      if (atualizar) _carregarProdutos();
    });
  }

  _goToDetalhes(ProdutoModel produto) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoDetalhes(
        produto: produto,
        atualizar: _carregarProdutos,
      );
    }));
  }

  _goToNew() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoForm();
    })).then((atualizar) {
      if (atualizar) _carregarProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _goToNew),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        children: _produtos.map((p) {
          return ProdutoCard(
            produto: p,
            clickCard: () => _goToDetalhes(p),
            clickEdit: () => _goToEdit(p),
          );
        }).toList(),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text(_userEmail)),
            Spacer(),
            FlatButton.icon(onPressed: _sair, icon: Icon(Icons.exit_to_app), label: Text('Sair'))
          ]
        ),
      ),
    );
  }

  _sair() async {
    await _auth.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Entrar()));
  }
}
