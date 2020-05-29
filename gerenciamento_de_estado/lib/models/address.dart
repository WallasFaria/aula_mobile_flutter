class Address {
  String street;
  String number;
  String complement;
  String neighborhood;
  String city;
  String uf;

  Address(
      {this.street,
      this.number,
      this.complement,
      this.neighborhood,
      this.city,
      this.uf});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    number = json['number'];
    complement = json['complement'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    uf = json['uf'];
  }
}
