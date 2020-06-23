import 'package:loja/models/produto_model.dart';
import 'package:loja/services/produto_service.dart';
import 'package:mobx/mobx.dart';
part 'busca_controller.g.dart';

class BuscaController = _BuscaControllerBase with _$BuscaController;

abstract class _BuscaControllerBase with Store {
  final _service = ProdutoService();

  @observable
  ObservableList<ProdutoModel> produtos = ObservableList();

  @observable
  int proximaPagina = 0;

  @action
  buscar(String termo, [int pagina = 1]) async {
    try {
      final resp = await _service.getProdutos(pagina: pagina, termoDeBusca: termo);
      produtos = resp.produtos.asObservable();
      proximaPagina = resp.proximaPagina;
    } catch (e) {
      print(e);
    }
  }
}