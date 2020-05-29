
import 'package:dio/dio.dart';
import 'package:loja/utils/constants.dart';
import '../models/produto_model.dart';

class FirebaseProdutoService {
  final _dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<List<ProdutoModel>> getProdutos() async {
    final resp = await  _dio.get('/produtos.json');
    final List<ProdutoModel> produtos = [];
    final Map<String, dynamic> data = resp.data;

    data.forEach((key, value) {
      final produto = ProdutoModel.fromJson(value);
      produto.id = key;
      produtos.add(produto);
    });

    return produtos;
  }

  Future<ProdutoModel> getProduto(int id) async {
    return null;
  }

  Future criarProduto(ProdutoModel produto) async {
    final resp = await _dio.post('/produtos.json', data: produto.toJson());
    produto.id = resp.data['name'];
    return produto;
  }

  Future deletarProduto(ProdutoModel produto) async {
    await _dio.delete('/produtos/${produto.id}.json');
  }

  Future<ProdutoModel> atualizarProduto(ProdutoModel produto) async {
    await _dio.put('/produtos/${produto.id}.json', data: produto.toJson());
    return produto;
  }
}
