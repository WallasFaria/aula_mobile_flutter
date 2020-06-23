import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja/components/custom_drawer.dart';
import 'package:loja/components/produto_card.dart';
import 'package:loja/controllers/produto_lista_controller.dart';
import 'package:loja/models/produto_model.dart';
import 'package:loja/pages/produto_detalhes.dart';
import 'package:loja/pages/produto_form.dart';

import 'busca.dart';

class ProdutoLista extends StatefulWidget {
  @override
  _ProdutoListaState createState() => _ProdutoListaState();
}

class _ProdutoListaState extends State<ProdutoLista> {
  final controller = ProdutoListaController();

  _goToEdit(ProdutoModel produto) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoForm(produto: produto);
    })).then((atualizar) {
      if (atualizar) controller.carregarProdutos();
    });
  }

  _goToDetalhes(ProdutoModel produto) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoDetalhes(
        produto: produto,
        atualizar: controller.carregarProdutos,
      );
    }));
  }

  _goToNew() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoForm();
    })).then((atualizar) {
      if (atualizar) controller.carregarProdutos();
    });
  }

  _goToSearch() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Busca();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _goToNew),
          IconButton(icon: Icon(Icons.search), onPressed: _goToSearch),
        ],
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Observer(builder: (_) {
              return ListView.builder(
                // shrinkWrap: true,
                itemCount: controller.produtos.length,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                itemBuilder: (_, index) {
                  final produto = controller.produtos[index];

                  if (controller.produtos.length == (index + 1)) {
                    if (controller.proximaPagina != null)
                      controller.carregarProdutos(controller.proximaPagina);
                  }

                  return ProdutoCard(
                    produto: produto,
                    clickCard: () => _goToDetalhes(produto),
                    clickEdit: () => _goToEdit(produto),
                  );
                },
              );
            }),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
