import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/controllers/initial.controller.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InitialController(context),
      child: CupertinoPageScaffold(
        child:
            Consumer<InitialController>(builder: (context, controller, child) {
          if (controller.loading)
            return Center(child: CupertinoActivityIndicator());

          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Bem Vindo',
                  style: Theme.of(context).textTheme.display1,
                ),
                Padding(padding: EdgeInsets.all(100)),
                SizedBox(
                  width: 300,
                  child: CupertinoButton.filled(
                    child: Text('Entrar'),
                    onPressed: controller.goToSigIn,
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                SizedBox(
                  width: 300,
                  child: CupertinoButton(
                    color: CupertinoColors.extraLightBackgroundGray,
                    child: Text(
                      'Registrar-se',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.button.color),
                    ),
                    onPressed: controller.goToSigUn,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
