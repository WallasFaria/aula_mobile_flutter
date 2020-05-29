import 'package:flutter/cupertino.dart';
import 'package:gerenciamento_de_estado/config/custom_dio.dart';
import 'package:gerenciamento_de_estado/services/auth.service.dart';
import 'package:provider/provider.dart';

import 'application.controller.dart';

class SignInController extends ChangeNotifier {
  final BuildContext context;

  final servive = AuthService(CustomDio());

  SignInController(this.context);

  void create(String email, String password) async {
    try {
      final user = await servive.signIn(email, password);
      _setCurrentUserToGlobalState(user);
      _setTokenInDioHeader(user);
      _saveTokenInLocalStorage(user.token);
      _redirectToHomePage();
    } catch (e) {
      // Exibir o erro;
    }
  }

  _saveTokenInLocalStorage(token) {
    servive.saveToken(token);
  }

  _setCurrentUserToGlobalState(user) {
    final app = Provider.of<ApplicationController>(context, listen: false);
    app.setCurrentUser(user);
  }

  _setTokenInDioHeader(user) {
    final dio = Provider.of<CustomDio>(context, listen: false);
    dio.options.headers.addAll({'authorization': 'Bearer ${user.token}'});
  }

  _redirectToHomePage() {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
