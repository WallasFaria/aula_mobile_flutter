
import 'package:dio/dio.dart';
import 'package:loja/utils/constants.dart';
import '../models/produto_model.dart';

class ProdutoService {
  final _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<List<ProdutoModel>> getProdutos() async {
    final resp = await  _dio.get('/produtos');

    return List<ProdutoModel>.from(resp.data.map((p) => ProdutoModel.fromJson(p)));
  }

  Future<ProdutoModel> getProduto(int id) async {
    return null;
  }

  Future<ProdutoModel> criarProduto(ProdutoModel produto) async {
    final resp = await _dio.post('/produtos', data: produto.toJson());
    return ProdutoModel.fromJson(resp.data);
  }

  Future deletarProduto(ProdutoModel produto) async {
    await _dio.delete('/produtos/${produto.id}');
  }

  Future<ProdutoModel> atualizarProduto(ProdutoModel produto) async {
    final resp = await _dio.put('/produtos/${produto.id}', data: produto.toJson());
    return ProdutoModel.fromJson(resp.data);
  }
}
