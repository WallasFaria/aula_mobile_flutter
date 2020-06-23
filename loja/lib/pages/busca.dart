import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja/components/produto_card.dart';
import 'package:loja/controllers/busca_controller.dart';
import 'package:loja/models/produto_model.dart';
import 'package:loja/pages/produto_detalhes.dart';
import 'package:loja/pages/produto_form.dart';

class Busca extends StatefulWidget {
  @override
  _BuscaState createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  final controller = BuscaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.grey[600]),
          title: TextField(
            autofocus: true,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'Buscar'),
            onSubmitted: (valor) => controller.buscar(valor),
          ),
        ),
        body: Observer(builder: (_) {
          return ListView.builder(
            // shrinkWrap: true,
            itemCount: controller.produtos.length,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            itemBuilder: (_, index) {
              final produto = controller.produtos[index];

              // if (controller.produtos.length == (index + 1)) {
              //   if (controller.proximaPagina != null)
              //     controller.buscar();
              // }

              return ProdutoCard(
                produto: produto,
                clickEdit: () => _goToEdit(produto),
                clickCard: () => _goToDetalhes(produto),
              );
            },
          );
        }));
  }

  _goToEdit(ProdutoModel produto) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoForm(produto: produto);
    }));
  }

  _goToDetalhes(ProdutoModel produto) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoDetalhes(produto: produto);
    }));
  }
}
