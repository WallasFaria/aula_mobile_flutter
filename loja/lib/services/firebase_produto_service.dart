
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:loja/utils/constants.dart';
import '../models/produto_model.dart';

class FirebaseProdutoService {
  final _dio = Dio(BaseOptions(baseUrl: BASE_URL));
  final _storage = FirebaseStorage(storageBucket: STORAGE_BUCKET);

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

  Future criarProduto(ProdutoModel produto, { File image }) async {
    if (image != null) {
      final imagePath = 'images/produto_${DateTime.now()}.png';
      final task = _storage.ref().child(imagePath).putFile(image);
      final snapshot = await task.onComplete;
      final url = await snapshot.ref.getDownloadURL();

      produto.imagem = url;
    }

    final resp = await _dio.post('/produtos.json', data: produto.toJson());
    produto.id = resp.data['name'];
    return produto;
  }

  Future deletarProduto(ProdutoModel produto) async {
    await _dio.delete('/produtos/${produto.id}.json');
  }

  Future<ProdutoModel> atualizarProduto(ProdutoModel produto, { File image }) async {
    if (image != null) {
      final imagePath = 'images/produto_${DateTime.now()}.png';
      final task = _storage.ref().child(imagePath).putFile(image);
      final snapshot = await task.onComplete;
      final url = await snapshot.ref.getDownloadURL();

      produto.imagem = url;
    }

    await _dio.put('/produtos/${produto.id}.json', data: produto.toJson());
    return produto;
  }
}
