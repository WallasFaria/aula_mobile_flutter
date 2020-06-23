// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'busca_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuscaController on _BuscaControllerBase, Store {
  final _$produtosAtom = Atom(name: '_BuscaControllerBase.produtos');

  @override
  ObservableList<ProdutoModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProdutoModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$proximaPaginaAtom = Atom(name: '_BuscaControllerBase.proximaPagina');

  @override
  int get proximaPagina {
    _$proximaPaginaAtom.reportRead();
    return super.proximaPagina;
  }

  @override
  set proximaPagina(int value) {
    _$proximaPaginaAtom.reportWrite(value, super.proximaPagina, () {
      super.proximaPagina = value;
    });
  }

  final _$buscarAsyncAction = AsyncAction('_BuscaControllerBase.buscar');

  @override
  Future buscar(String termo, [int pagina = 1]) {
    return _$buscarAsyncAction.run(() => super.buscar(termo, pagina));
  }

  @override
  String toString() {
    return '''
produtos: ${produtos},
proximaPagina: ${proximaPagina}
    ''';
  }
}
