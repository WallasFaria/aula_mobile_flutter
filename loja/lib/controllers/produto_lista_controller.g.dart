// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_lista_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoListaController on _ProdutoListaControllerBase, Store {
  final _$produtosAtom = Atom(name: '_ProdutoListaControllerBase.produtos');

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

  final _$proximaPaginaAtom =
      Atom(name: '_ProdutoListaControllerBase.proximaPagina');

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

  final _$userEmailAtom = Atom(name: '_ProdutoListaControllerBase.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ProdutoListaControllerBase.loading');

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

  final _$carregarProdutosAsyncAction =
      AsyncAction('_ProdutoListaControllerBase.carregarProdutos');

  @override
  Future carregarProdutos([int pagina = 1]) {
    return _$carregarProdutosAsyncAction
        .run(() => super.carregarProdutos(pagina));
  }

  final _$_ProdutoListaControllerBaseActionController =
      ActionController(name: '_ProdutoListaControllerBase');

  @override
  dynamic setUserEmail(String value) {
    final _$actionInfo = _$_ProdutoListaControllerBaseActionController
        .startAction(name: '_ProdutoListaControllerBase.setUserEmail');
    try {
      return super.setUserEmail(value);
    } finally {
      _$_ProdutoListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_ProdutoListaControllerBaseActionController
        .startAction(name: '_ProdutoListaControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ProdutoListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produtos: ${produtos},
proximaPagina: ${proximaPagina},
userEmail: ${userEmail},
loading: ${loading}
    ''';
  }
}
