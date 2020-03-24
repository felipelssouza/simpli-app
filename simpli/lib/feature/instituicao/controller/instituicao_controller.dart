import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:simpli/application/api.dart';
import 'package:simpli/application/base_controller.dart';
import 'package:simpli/feature/instituicao/model/instituicao.dart';

class InstituicaoController extends BaseController {

  Future<InstituicaoList> listar() async {
    String rota = 'instituicoes/listar';

    Response response = await Api.get(rota);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(response.body);
    }

    InstituicaoList lista = InstituicaoList.fromJson(jsonDecode(response.body));

    return lista;
  }
}
