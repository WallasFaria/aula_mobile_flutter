import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja/components/resultado.dart';
import 'package:loja/models/contador.dart';
import 'package:provider/provider.dart';

class TexteMobx extends StatefulWidget {
  @override
  _TexteMobxState createState() => _TexteMobxState();
}

class _TexteMobxState extends State<TexteMobx> {
  @override
  Widget build(BuildContext context) {
    final contador = Provider.of<Contador>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Mobx'),
      ),
      body: Column(
        children: <Widget>[
          Resultado(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: contador.diminuir,
                child: Text('Diminuir'),
              ),
              RaisedButton(
                onPressed: contador.almentar,
                child: Text('Almentar'),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Observer(builder: (_) {
              return Text(contador.positivoNegativo);
            }),
          )
        ],
      ),
    );
  }
}
