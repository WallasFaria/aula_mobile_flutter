
import 'package:dio/dio.dart';
import 'package:loja/models/perfil_model.dart';
import 'package:loja/utils/http.dart';

class PerfilService {
  final _dio = HttpClient.instance;

  Future<PerfilModel> criarPerfil(PerfilModel perfil) async {
    final resp = await _dio.post('/perfils', data: perfil.toJson());

    return PerfilModel.fromJson(resp.data);
  }

  Future<PerfilModel> getPerfil(String uid) async {
    final resp = await _dio.get('/perfils/me', options: Options(headers: { 'token': uid }));

    return PerfilModel.fromJson(resp.data);
  }
}
