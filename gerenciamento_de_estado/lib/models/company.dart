import 'address.dart';
import 'category.dart';

class Company {
  int id;
  String fantasyName;
  String logo;
  Address address;
  List<Category> categories;

  Company(
      {this.id, this.fantasyName, this.logo, this.address, this.categories});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fantasyName = json['fantasy_name'];
    logo = json['logo'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['categories'] != null) {
      categories = new List<Category>();
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
  }
}
