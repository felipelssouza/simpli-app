import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:simpli/application/api.dart';
import 'package:simpli/application/base_controller.dart';
import 'package:simpli/feature/login/model/login.dart';

class LoginController extends BaseController {
  Future<Login> login(Login body) async {
    String rota = "auth/login";

    Response response = await Api.post(rota, body.toJson());

    if (response.statusCode != HttpStatus.ok) {
      throw Exception(response.body);
    }

    Login login = Login.fromJson(jsonDecode(response.body));

    return login;
  }
}
