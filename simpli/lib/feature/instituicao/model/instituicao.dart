import 'package:simpli/feature/investimento/model/investimento.dart';

class Instituicao {
  final String nome;
  final double saldoLiqudo;
  final double saldoBruto;
  final double porcentagem;
  final String asset;
  final List<Investimento> investimentos;

  Instituicao(
      {this.nome,
      this.saldoLiqudo,
      this.saldoBruto,
      this.porcentagem,
      this.asset,
      this.investimentos});

  factory Instituicao.fromJson(Map<String, dynamic> json) {
//    var list = json['investimentos'] as List;
//    List<Investimento> investimentoList =
//        list.map((i) => Investimento.fromJson(i)).toList();

    return new Instituicao(
        nome: json["nome"],
        saldoLiqudo: json["saldo_liquido"],
        saldoBruto: json["saldo_bruto"],
        porcentagem: json["porcentagem"],
        asset: json["asset"]);
//        investimentos: investimentoList);
  }
}

class InstituicaoList {
  final List<Instituicao> instituicoes;

  InstituicaoList({this.instituicoes});

  factory InstituicaoList.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson['data'] as List;
    List<Instituicao> instituicoes =
        data.map((i) => Instituicao.fromJson(i)).toList();

    return new InstituicaoList(instituicoes: instituicoes);
  }
}
