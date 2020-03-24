import 'dart:convert';

class NovaSenha {
  String email;
  String senha;
  String senhaAntiga;

  NovaSenha({this.email, this.senha, this.senhaAntiga});

//  factory NovaSenha.fromJson(Map<String, dynamic> json) {
//    return new NovaSenha(
//        email: json['email'],
//        senha: json['senha'],
//        senhaAntiga: json['senha_antiga']);
//  }

  String toJson() {
    var map = new Map();
    map['email'] = email;
    map['senha'] = senha;
    map['senha_antiga'] = senhaAntiga;
    return json.encode(map);
  }
}
