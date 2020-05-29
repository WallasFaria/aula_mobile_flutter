import 'package:flutter/material.dart';

import 'models/tarefa.dart';
import 'tarefa_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarefa> _tarefas = [];
  final textController = TextEditingController();

  void _sort() {
    setState(() => _tarefas.sort((t1, t2) => t1.feita ? 1 : 0));
  }

  void _addTarefa() {
    if (textController.text.isEmpty) return;
    setState(() => _tarefas.add(Tarefa(titulo: textController.text)));
    _sort();
    textController.text = '';
    Navigator.of(context).pop();
  }

  void _removerTarefa(Tarefa tarefa) {
    setState(() => _tarefas.remove(tarefa));
  }

  void _marcarTarefa(Tarefa tarefa, bool feita) {
    setState(() => tarefa.feita = feita);
    _sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: _tarefas.map((tarefa) {
          return TarefaWidget(
            tarefa: tarefa,
            onRemove: _removerTarefa,
            onCheck: _marcarTarefa,
          );
        }).toList(),
      ),
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
        controller: textController,
        onSubmitted: (_) => _addTarefa(),
      ),
    );
  }
}
