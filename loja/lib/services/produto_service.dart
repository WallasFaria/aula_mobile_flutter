import 'dart:io';

import 'package:dio/dio.dart';
import 'package:loja/utils/http.dart';

import '../models/produto_model.dart';

class ProdutoService {
  final _dio = HttpClient.instance;

  Future<List<ProdutoModel>> getProdutos() async {
    final resp = await _dio.get('/produtos');

    return List<ProdutoModel>.from(
        resp.data.map((p) => ProdutoModel.fromJson(p)));
  }

  Future<ProdutoModel> getProduto(int id) async {
    return null;
  }

  Future<ProdutoModel> criarProduto(ProdutoModel produto, {File image}) async {
    final produtoData = produto.toJson();

    if (image != null) {
      String fileName = image.path.split('/').last;
      final file = await MultipartFile.fromFile(image.path, filename: fileName);
      produtoData['foto'] = file;
    }

    final data = FormData.fromMap({'produto': produtoData});

    final resp = await _dio.post('/produtos', data: data);
    return ProdutoModel.fromJson(resp.data);
  }

  Future deletarProduto(ProdutoModel produto) async {
    await _dio.delete('/produtos/${produto.id}');
  }

  Future<ProdutoModel> atualizarProduto(ProdutoModel produto, {File image}) async {
    final produtoData = produto.toJson();

    if (image != null) {
      String fileName = image.path.split('/').last;
      final file = await MultipartFile.fromFile(image.path, filename: fileName);
      produtoData['foto'] = file;
    }

    final data = FormData.fromMap({'produto': produtoData});

    final resp = await _dio.put('/produtos/${produto.id}', data: data);
    return ProdutoModel.fromJson(resp.data);
  }
}
