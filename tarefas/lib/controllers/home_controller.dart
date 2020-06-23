import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tarefas/models/tarefa.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final textController = TextEditingController();

  @observable
  ObservableList<Tarefa> tarefas = new ObservableList();

  @action
  addTarefa() {
    if (textController.text.isEmpty) return;
    tarefas.add(Tarefa(titulo: textController.text));
    textController.clear();
  }

  @action
  removerTarefa(Tarefa tarefa) => tarefas.remove(tarefa);

  @action
  marcarTarefa(Tarefa tarefa, bool feita) {
    int index = tarefas.indexOf(tarefa);
    tarefas.remove(tarefa);
    tarefa.feita = feita;
    tarefas.insert(index, tarefa);
    sort();
  }

  @action
  sort() {
    tarefas.sort((t1, t2) => t1.feita ? 1 : 0);
    tarefas = tarefas;
  }

  @computed
  List<Tarefa> get completas {
    return List<Tarefa>.from(tarefas.where((t) => t.feita));
  }

  @computed
  List<Tarefa> get imcompletas {
    return  List<Tarefa>.from(tarefas.where((t) => !t.feita));
  }
}