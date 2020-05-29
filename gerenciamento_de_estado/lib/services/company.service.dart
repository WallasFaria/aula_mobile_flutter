import 'package:dio/dio.dart';
import 'package:gerenciamento_de_estado/models/company.dart';

class CompanyService {
  final Dio _http;

  CompanyService(this._http);

  Future<List<Company>> getComanies() async {
    final resp = await _http.get('/companies');
    final companies = resp.data['items'].map((c) => Company.fromJson(c));
    return List<Company>.from(companies);
  }
}
