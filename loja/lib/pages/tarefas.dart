import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/models/tarefa.dart';

import '../components/tarefa_widget.dart';

class Tarefas extends StatefulWidget {
  @override
  _TarefasState createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  final _textController = TextEditingController();
  final tarefas = Firestore.instance.collection('tarefas');

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTarefa() {
    if (_textController.text.isNotEmpty) {
      final tarefa = Tarefa(titulo: _textController.text, feita: false);
      tarefas.document().setData(tarefa.toMap());
      Navigator.of(context).pop();
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: StreamBuilder<QuerySnapshot>(
          stream: tarefas.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

            if (snapshot.connectionState == ConnectionState.waiting)
              return new Text('Loading...');
            else
              return ListView(
                padding: EdgeInsets.all(5),
                children: snapshot.data.documents.map((data) {
                  final tarefa = Tarefa.fromFirebae(data.reference, data.data);
                  return TarefaWidget(tarefa: tarefa);
                }).toList(),
              );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void abrirFormulario() {
    showDialog(
      context: this.context,
      builder: (context) {
        return Dialog(child: form);
      },
    );
  }

  Widget get form {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Nova tarefa',
          suffix: IconButton(
            onPressed: _addTarefa,
            icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
          ),
        ),
        textInputAction: TextInputAction.go,
        controller: _textController,
        onSubmitted: (_) => _addTarefa(),
      ),
    );
  }
}
