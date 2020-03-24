import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:simpli/application/base_controller.dart';

abstract class Api {
  static final String _router = BaseController.kBaseApiEndpoint;

  static Future<http.Response> get(String url) async {
    return await http.get(_router + url, headers: headers());
  }

  static Future<http.Response> post(String url, var dados) async {
    return await http.post(_router + url, headers: headers(), body: dados);
  }

  static Map<String, String> headers() => {"Content-Type": "application/json"};
}
