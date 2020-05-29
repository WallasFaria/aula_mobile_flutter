import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gerenciamento_de_estado/config/custom_dio.dart';
import 'package:gerenciamento_de_estado/models/company.dart';
import 'package:gerenciamento_de_estado/services/company.service.dart';
import 'package:provider/provider.dart';

class CompaniesController extends ChangeNotifier {
  final BuildContext context;
  CompanyService service;

  CompaniesController(this.context) {
    service = CompanyService(Provider.of<CustomDio>(context, listen: false));
    getCompanies();
  }

  List<Company> companies;

  void getCompanies() {
    service.getComanies().then((_companies) {
      companies = _companies;
      notifyListeners();
    });
  }
}
