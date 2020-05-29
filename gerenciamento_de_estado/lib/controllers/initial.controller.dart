import 'package:flutter/widgets.dart';
import 'package:gerenciamento_de_estado/controllers/application.controller.dart';
import 'package:provider/provider.dart';

class InitialController extends ChangeNotifier {
  final BuildContext context;
  ApplicationController appController;

  var loading = true;

  InitialController(this.context) {
    verifyCurrentUser();
  }

  verifyCurrentUser() async {
    appController = Provider.of<ApplicationController>(context, listen: false);
    appController.getCurrentUser().then((user) {
      appController.setCurrentUser(user);
      Navigator.pushReplacementNamed(context, '/home');
    }).catchError((e) {
      loading = false;
      notifyListeners();
    });
  }

  void goToSigIn() => Navigator.pushNamed(context, '/sign_in');
  void goToSigUn() => Navigator.pushNamed(context, '/sign_up');
}
