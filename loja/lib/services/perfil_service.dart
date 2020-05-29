
import 'package:dio/dio.dart';
import 'package:loja/models/perfil_model.dart';
import 'package:loja/utils/constants.dart';

class PerfilService {
  final _dio = Dio(BaseOptions(baseUrl: BASE_URL_API));

  Future<PerfilModel> criarPerfil(PerfilModel perfil) async {
    final resp = await _dio.post('/perfils', data: perfil.toJson());

    return PerfilModel.fromJson(resp.data);
  }

  Future<PerfilModel> getPerfil(String uid) async {
    final resp = await _dio.get('/perfils/me');

    return PerfilModel.fromJson(resp.data);
  }
}
