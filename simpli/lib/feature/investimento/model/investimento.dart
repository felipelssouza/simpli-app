import 'package:simpli/feature/investimento/model/classe.dart';

class Investimento {
  final String nome;
  final String descricao;
  final double taxaAdminstrativa;
  final Classe classe;

  Investimento(
      {this.nome,
      this.descricao,
      this.taxaAdminstrativa,
      this.classe});

  factory Investimento.fromJson(Map<String, dynamic> json) {
    return new Investimento(
        nome: json["nome"],
        descricao: json["descricao"],
        taxaAdminstrativa: json["taxa_administrativa"]);
//        instituicao: Instituicao.fromJson(json['instituicao']));
//        classe: Classe.fromJson(json['classe']));
  }
}

class InvestimentoList {
  final List<Investimento> investimentos;

  InvestimentoList({this.investimentos});

  factory InvestimentoList.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson['data'] as List;
    List<Investimento> investimentos =
        data.map((i) => Investimento.fromJson(i)).toList();

    return new InvestimentoList(investimentos: investimentos);
  }
}
