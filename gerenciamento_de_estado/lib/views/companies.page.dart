import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/controllers/application.controller.dart';
import 'package:gerenciamento_de_estado/controllers/companies.controller.dart';
import 'package:provider/provider.dart';

class CompaniesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompaniesController(context),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Empresas'),
          trailing: Consumer<ApplicationController>(
              builder: (context, controller, child) {
            return CupertinoButton(
              child: Icon(Icons.close),
              onPressed: () => controller.logout(context),
            );
          }),
        ),
        child: Consumer<CompaniesController>(
          builder: (context, controller, child) {
            if (controller.companies == null)
              Center(child: CupertinoActivityIndicator());

            return ListView(
              children: controller.companies.map((c) => _item(c)).toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _item(company) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E5E5E5)),
        ),
      ),
      child: Row(
        children: <Widget>[
          Image.network(company.logo ?? '', width: 50, height: 20),
          Padding(padding: EdgeInsets.all(10)),
          Text(company.fantasyName),
        ],
      ),
    );
  }
}
