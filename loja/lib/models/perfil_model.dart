class PerfilModel {
  int id;
  String nome;
  String dataDeNascimento;
  String telefone;
  String createdAt;
  String updatedAt;
  String uid;

  PerfilModel(
      {this.id,
      this.nome,
      this.dataDeNascimento,
      this.telefone,
      this.createdAt,
      this.updatedAt,
      this.uid});

  PerfilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dataDeNascimento = json['data_de_nascimento'];
    telefone = json['telefone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['data_de_nascimento'] = this.dataDeNascimento;
    data['telefone'] = this.telefone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['uid'] = this.uid;
    return data;
  }
}