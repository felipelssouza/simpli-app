import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:simpli/application/api.dart';
import 'package:simpli/application/base_controller.dart';
import 'package:simpli/feature/instituicao/model/instituicao.dart';

class InvestimentoController extends BaseController {
  Future<InstituicaoList> listarConsolidadoPorInstituicao(
      String codigoUsuario) async {
    String rota = 'investimentos/instituicoes?codigoUsuario=$codigoUsuario';

    Response response = await Api.get(rota);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(response.body);
    }

    InstituicaoList lista = InstituicaoList.fromJson(jsonDecode(response.body));

    return lista;
  }
}
