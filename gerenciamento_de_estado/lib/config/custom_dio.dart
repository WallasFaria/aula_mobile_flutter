import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = 'http://localhost:3000/api';
    options.contentType = 'application/json';
  }
}
