import 'package:flutter/material.dart';

import '../models/tarefa.dart';

class TarefaWidget extends StatelessWidget {
  final Tarefa tarefa;

  TarefaWidget({Key key, @required this.tarefa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Checkbox(
            value: tarefa.feita,
            onChanged: (value) => tarefa.reference.updateData({'feita': value}),
          ),
          Expanded(
            child: Text(
              tarefa.titulo,
              style:
                  TextStyle(color: Theme.of(context).textTheme.caption.color),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => tarefa.reference.delete(),
          )
        ],
      ),
    );
  }
}
