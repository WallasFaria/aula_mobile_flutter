import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja/models/produto_model.dart';
import 'package:loja/services/produto_service.dart';
import 'package:mobx/mobx.dart';
part 'produto_lista_controller.g.dart';

class ProdutoListaController = _ProdutoListaControllerBase with _$ProdutoListaController;

abstract class _ProdutoListaControllerBase with Store {
  final _service = ProdutoService();
  final auth = FirebaseAuth.instance;

  _ProdutoListaControllerBase() {
    auth.currentUser().then((user) {
      setUserEmail(user.email);
    });
    carregarProdutos();
  }

  @observable
  ObservableList<ProdutoModel> produtos = ObservableList();

  @observable
  int proximaPagina = 0;
  
  @observable
  var userEmail = '';

  @observable
  bool loading = true;

  @action
  setUserEmail(String value) => userEmail = value;

  @action
  setLoading(bool value) => loading = value;

  @action
  carregarProdutos([int pagina = 1]) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 3));
    try {
      final resp = await _service.getProdutos(pagina: pagina);
      produtos.addAll(resp.produtos);
      proximaPagina = resp.proximaPagina;
      setLoading(false);
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}