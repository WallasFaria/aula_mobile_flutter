import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/custom_dio.dart';
import 'controllers/application.controller.dart';
import 'views/initial.page.dart';
import 'views/sign_in.page.dart';
import 'views/sign_up.page.dart';
import 'views/companies.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CustomDio()),
        ChangeNotifierProvider<ApplicationController>(
          create: (context) => ApplicationController(context),
        ),
      ],
      child: CupertinoApp(
        title: 'Flutter Demo',
        theme: CupertinoThemeData(),
        initialRoute: '/',
        routes: {
          '/': (_) => InitialPage(),
          '/sign_in': (_) => SignInPage(),
          '/sign_up': (_) => SignUpPage(),
          '/home': (_) => CompaniesPage(),
        },
      ),
    );
  }
}
