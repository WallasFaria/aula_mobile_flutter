// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Tarefa>> _$completasComputed;

  @override
  List<Tarefa> get completas =>
      (_$completasComputed ??= Computed<List<Tarefa>>(() => super.completas,
              name: '_HomeControllerBase.completas'))
          .value;
  Computed<List<Tarefa>> _$imcompletasComputed;

  @override
  List<Tarefa> get imcompletas =>
      (_$imcompletasComputed ??= Computed<List<Tarefa>>(() => super.imcompletas,
              name: '_HomeControllerBase.imcompletas'))
          .value;

  final _$tarefasAtom = Atom(name: '_HomeControllerBase.tarefas');

  @override
  ObservableList<Tarefa> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(ObservableList<Tarefa> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addTarefa() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addTarefa');
    try {
      return super.addTarefa();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removerTarefa(Tarefa tarefa) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removerTarefa');
    try {
      return super.removerTarefa(tarefa);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic marcarTarefa(Tarefa tarefa, bool feita) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.marcarTarefa');
    try {
      return super.marcarTarefa(tarefa, feita);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sort() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.sort');
    try {
      return super.sort();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas},
completas: ${completas},
imcompletas: ${imcompletas}
    ''';
  }
}
