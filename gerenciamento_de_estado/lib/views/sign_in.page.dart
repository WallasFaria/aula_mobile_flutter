import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/controllers/sign_in.controller.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInController(context),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Entrar')),
        child:
            Consumer<SignInController>(builder: (context, controller, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: form,
                child: Container(
                  height: 500,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CupertinoTextField(
                        controller: emailController,
                        placeholder: 'Email',
                        padding: EdgeInsets.all(14),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      CupertinoTextField(
                        controller: passwordController,
                        placeholder: 'Senha',
                        obscureText: true,
                        padding: EdgeInsets.all(14),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton.filled(
                          child: Text('Entrar'),
                          onPressed: () {
                            controller.create(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
