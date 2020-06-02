import 'package:dio/dio.dart';

import 'constants.dart';

class HttpClient {
  static Dio _instance;

  HttpClient._();

  static Dio get instance {
    if (_instance == null) {
      _instance = Dio(BaseOptions(baseUrl: BASE_URL_API));
    }

    return _instance;
  }
}
