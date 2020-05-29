import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final Function(String) onSave;

  UserPage({Key key, @required this.onSave}) : super(key: key);

  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar Usuário',
            style: TextStyle(color: Color(0xFF666666))),
        centerTitle: false,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
      ),
      body: Column(children: [
        Container(
          child: Text('Entre com seu nome de usuário do Github'),
          padding: EdgeInsets.all(20),
        ),
        Container(
          child: TextField(autofocus: true, controller: inputController),
          padding: EdgeInsets.all(20),
        ),
        Spacer(),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(20),
            onPressed: () {
              onSave(inputController.text);
              Navigator.pop(context);
            },
            child: Text('Salvar'),
          ),
        )
      ]),
    );
  }
}
