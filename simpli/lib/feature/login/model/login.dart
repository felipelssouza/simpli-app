import 'dart:convert';

import 'package:simpli/feature/cadastro/usuario/model/usuario.dart';

class Login {
  String email;
  String senha;
  bool trocaSenha;
  Usuario usuario;

  Login({
    this.email,
    this.senha,
    this.trocaSenha,
    this.usuario,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return new Login(
        email: json['email'],
        senha: json['senha'],
        trocaSenha: json['nova_senha_obrigatoria'],
        usuario: Usuario.fromJson(json['usuario'])
    );
  }

  String toJson() {
    var map = new Map();
    map['senha'] = senha;
    map['email'] = email;
    return json.encode(map);
  }
}
