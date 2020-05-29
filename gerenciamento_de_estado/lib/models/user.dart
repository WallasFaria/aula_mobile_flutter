class User {
  int id;
  String name;
  String cpf;
  String email;
  String password;
  DateTime dateOfBirth;
  String token;

  User(
      {this.id,
      this.name,
      this.email,
      this.cpf,
      this.dateOfBirth,
      this.password});

  User.fromJson(json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    cpf = json['cpf'];
    token = json['token'];
    dateOfBirth = DateTime.tryParse(json['date_of_birth']);
  }

  Map<String, String> toJson() => {
        'name': name,
        'email': email,
        'cpf': cpf,
        'date_of_birth': dateOfBirth.toIso8601String(),
        'password': password,
      };
}
