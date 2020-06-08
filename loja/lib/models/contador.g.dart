// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contador.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Contador on _ContadorBase, Store {
  final _$valorAtom = Atom(name: '_ContadorBase.valor');

  @override
  int get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(int value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ContadorBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_ContadorBaseActionController =
      ActionController(name: '_ContadorBase');

  @override
  void almentar() {
    final _$actionInfo = _$_ContadorBaseActionController.startAction(
        name: '_ContadorBase.almentar');
    try {
      return super.almentar();
    } finally {
      _$_ContadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void diminuir() {
    final _$actionInfo = _$_ContadorBaseActionController.startAction(
        name: '_ContadorBase.diminuir');
    try {
      return super.diminuir();
    } finally {
      _$_ContadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valor: ${valor},
loading: ${loading}
    ''';
  }
}
