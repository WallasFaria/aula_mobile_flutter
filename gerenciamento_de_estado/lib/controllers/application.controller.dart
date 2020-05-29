import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gerenciamento_de_estado/config/custom_dio.dart';
import 'package:gerenciamento_de_estado/models/user.dart';
import 'package:gerenciamento_de_estado/services/auth.service.dart';
import 'package:provider/provider.dart';

class ApplicationController extends ChangeNotifier {
  User currentUser;
  final BuildContext context;
  CustomDio _http;
  AuthService authServise;

  ApplicationController(this.context) {
    _http = Provider.of<CustomDio>(context, listen: false);
    authServise = AuthService(_http);
  }

  Future<User> getCurrentUser() async {
    String token = await authServise.getToken();
    _http.options.headers.addAll({'authorization': 'Bearer $token'});
    return await authServise.getCurrentUser();
  }

  logout(pageContext) {
    authServise.saveToken('');
    _http.options.headers.remove('authentication');
    setCurrentUser(null);
    Navigator.pushReplacementNamed(pageContext, '/');
  }

  setCurrentUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  removeCurrentUser() {}
}
