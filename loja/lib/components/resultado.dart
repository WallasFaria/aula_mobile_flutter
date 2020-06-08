import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja/models/contador.dart';
import 'package:provider/provider.dart';

class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contador = Provider.of<Contador>(context);

    return Container(
      child: Center(child: Observer(builder: (_) {
        return Text(contador.valor.toString());
      })),
      width: 50,
      height: 50,
      color: Colors.grey[300],
    );
  }
}
