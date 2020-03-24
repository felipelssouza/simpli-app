import 'package:http/http.dart';
import 'package:simpli/application/api.dart';
import 'package:simpli/application/base_controller.dart';
import 'package:simpli/feature/cadastro/usuario/model/usuario.dart';

class UsuarioController extends BaseController {

  Future<void> registrar(Usuario body) async {
    String rota = "usuarios/criar";

    Response response = await Api.post(rota, body.toJson());

//  if (response.statusCode != HttpStatus.ok) {
//    ErroDTO erroDTO = ErroDTO.fromJson(jsonDecode(response.body));
//    throw Exception(erroDTO.descricao);
  }

  Future<void> registrarNovaSenha(Usuario body) async {
    String rota = "usuarios/nova_senha";

    Response response = await Api.post(rota, body.toJson());

    // TODO: implementar tratamento erro
  }


}
