import 'package:dio/dio.dart';
import 'package:gerenciamento_de_estado/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _http;

  AuthService(this._http);

  Future<User> signIn(String email, String password) async {
    final resp = await _http.post('/authentication', data: {
      'entity_type': 'Customer',
      'email': email,
      'password': password
    });

    return User.fromJson(resp.data);
  }

  Future<User> signUp(User user) async {
    final resp = await _http.post('/customers', data: user.toJson());

    return User.fromJson(resp.data);
  }

  Future<User> getCurrentUser() async {
    final resp = await _http.get('/profile');

    return User.fromJson(resp.data);
  }

  void saveToken(String token) async {
    // SharedPreferences.getInstance().then((pref) {
    //   pref.setString('user_token', token);
    // });

    final pref = await SharedPreferences.getInstance();
    pref.setString('user_token', token);
  }

  Future<String> getToken() async {
    try {
      final pref = await SharedPreferences.getInstance();
      return pref.getString('user_token') ?? '';
    } catch (e) {
      return '';
    }
  }
}
