class ProdutoModel {
  String id;
  String nome;
  String descricao;
  double preco;
  int estoque;
  String imagem;
  String createdAt;
  String updatedAt;

  String get precoFormatado {
    return preco.toString().replaceAll('.', ',');
  }

  ProdutoModel(
      {this.id,
      this.nome,
      this.descricao,
      this.preco,
      this.estoque,
      this.imagem,
      this.createdAt,
      this.updatedAt});

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'] is double ?  json['preco'] : double.tryParse(json['preco']);
    estoque = json['estoque'];
    imagem = json['imagem'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['estoque'] = this.estoque;
    data['imagem'] = this.imagem;
    return data;
  }
}
