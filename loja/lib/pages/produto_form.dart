import 'package:flutter/material.dart';
import 'package:loja/models/produto_model.dart';
import 'package:loja/services/firebase_produto_service.dart';
import 'package:loja/services/produto_service.dart';
import 'package:loja/validators/nome_validator.dart';

class ProdutoForm extends StatefulWidget {
  final ProdutoModel produto;

  const ProdutoForm({Key key, this.produto}) : super(key: key);
  @override
  _ProdutoFormState createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final _form = GlobalKey<FormState>();

  var _produto = ProdutoModel();
  var _editMode = false;

  final _service = FirebaseProdutoService();

  initState() {
    super.initState();
    if (widget.produto != null) {
      _produto = widget.produto;
      _editMode = true;
    }
  }

  _save() async {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      try {
        if (_editMode) {
          await _service.atualizarProduto(_produto);
        } else {
          await _service.criarProduto(_produto);
        }
        Navigator.of(context).pop(true);
      } catch (err) {
        if (err.response.statusCode == 422) {
          print(err.response.data);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editMode ? 'Edição' : 'Novo Produto'),
        actions: <Widget>[IconButton(icon: Icon(Icons.save), onPressed: _save)],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                initialValue: _produto.nome,
                onSaved: (value) => _produto.nome = value,
                validator: nomeValidator,
              ),
              TextFormField(
                initialValue: _produto.descricao,
                decoration: InputDecoration(labelText: 'descricao'),
                maxLines: 2,
                onSaved: (value) => _produto.descricao = value,
              ),
              TextFormField(
                initialValue: _produto.preco?.toString(),
                decoration: InputDecoration(labelText: 'Preço'),
                onSaved: (value) => _produto.preco = double.tryParse(value),
              ),
              TextFormField(
                initialValue: _produto.estoque?.toString(),
                decoration: InputDecoration(labelText: 'Estoque'),
                onSaved: (value) => _produto.estoque = int.tryParse(value),
              ),
              TextFormField(
                initialValue: _produto.imagem,
                decoration: InputDecoration(labelText: 'Imagem'),
                onSaved: (value) => _produto.imagem = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
