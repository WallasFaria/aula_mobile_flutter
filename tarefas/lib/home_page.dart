import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tarefas/controllers/home_controller.dart';

import 'tarefa_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  void _addTarefa() {
    _controller.addTarefa();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: Observer(builder: (_) {
        return ListView(
          padding: EdgeInsets.all(5),
          children: _controller.imcompletas.map((tarefa) {
            return TarefaWidget(
              tarefa: tarefa,
              onRemove: _controller.removerTarefa,
              onCheck: _controller.marcarTarefa,
            );
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
        controller: _controller.textController,
        onSubmitted: (_) => _addTarefa(),
      ),
    );
  }
}
