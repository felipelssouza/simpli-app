import 'dart:convert';

class Usuario {
  String nome;
  String email;

  Usuario({
    this.nome,
    this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return new Usuario(nome: json['nome'], email: json['email']);
  }

  String toJson() {
    var map = new Map();
    map['nome'] = nome;
    map['email'] = email;
    return json.encode(map);
  }
}
