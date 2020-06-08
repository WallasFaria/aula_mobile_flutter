import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/contador.dart';
import 'pages/inicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Contador>(create: (_) => Contador()),
      ],
      child: MaterialApp(
        title: 'Loja Admin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Inicial(),
      ),
    );
  }
}
