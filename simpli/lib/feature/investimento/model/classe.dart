class Classe {
  final String nome;
  final String descricao;

  Classe({this.nome, this.descricao});

  factory Classe.fromJson(Map<String, dynamic> json) {
    return new Classe(nome: json['nome'], descricao: json['descricao']);
  }
}
