import 'package:flutter/material.dart';
import 'package:loja/models/produto_model.dart';

class ProdutoCard extends StatelessWidget {
  final ProdutoModel produto;
  final Function() clickCard;
  final Function() clickEdit;

  const ProdutoCard({Key key, this.produto, this.clickCard, this.clickEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(produto.imagem),
        title: Text(produto.nome),
        subtitle: Text('R\$ ${produto.preco}'),
        trailing: Container(
          width: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(produto.estoque.toString()),
              IconButton(icon: Icon(Icons.edit), onPressed: clickEdit)
            ],
          ),
        ),
        onTap: clickCard,
      ),
    );
  }
}
