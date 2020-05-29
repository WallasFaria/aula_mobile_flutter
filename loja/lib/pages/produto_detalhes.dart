import 'package:flutter/material.dart';
import 'package:loja/models/produto_model.dart';
import 'package:loja/pages/produto_form.dart';
import 'package:loja/services/firebase_produto_service.dart';
import 'package:loja/services/produto_service.dart';

class ProdutoDetalhes extends StatefulWidget {
  final ProdutoModel produto;
  final Function() atualizar;

  const ProdutoDetalhes({Key key, @required this.produto, this.atualizar}) : super(key: key);

  @override
  _ProdutoDetalhesState createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  final service = FirebaseProdutoService();

  _deletar() async {
    await service.deletarProduto(widget.produto);
    widget.atualizar();
    Navigator.of(context).pop();
  }

  _editar() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProdutoForm(produto: widget.produto);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: _editar),
          IconButton(icon: Icon(Icons.delete), onPressed: _deletar)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(widget.produto.imagem),
            Padding(padding: EdgeInsets.all(8)),
            Text(widget.produto.nome),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('R\$ ${widget.produto.precoFormatado}'),
                Text('Estoque: ${widget.produto.estoque}'),
              ],
            ),
            Container(
              width: double.infinity,
              child: Text(widget.produto.descricao),
            )
          ],
        ),
      ),
    );
  }
}
