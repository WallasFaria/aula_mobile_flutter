import 'dart:io';

import 'package:dio/dio.dart';
import 'package:loja/utils/http.dart';

import '../models/produto_model.dart';

class ProdutoService {
  final _dio = HttpClient.instance;

  Future<ProdutoResposta> getProdutos({String termoDeBusca, int pagina = 1}) async {
    final resp = await _dio.get('/produtos', queryParameters: { 'page': pagina, 'search': termoDeBusca });
    final produtos = List<ProdutoModel>.from(
        resp.data['itens'].map((p) => ProdutoModel.fromJson(p)));
    return ProdutoResposta(produtos, resp.data['paginacao']['proxima_pagina']);
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

class ProdutoResposta {
  final List<ProdutoModel> produtos;
  final int proximaPagina;

  ProdutoResposta(this.produtos, this.proximaPagina);
}