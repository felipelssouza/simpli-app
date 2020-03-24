import 'package:flutter/material.dart';
import 'package:simpli/feature/cadastro/usuario/model/usuario.dart';
import 'package:simpli/feature/cadastro/usuario/usuario_controller.dart';
import 'package:simpli/ui/custom_button.dart';
import 'package:simpli/feature/util/cores_util.dart';

class UsuarioForm extends StatefulWidget {
  UsuarioForm({Key key}) : super(key: key);

  @override
  _UsuarioFormState createState() => new _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  bool _autovalidate = false;
  bool _formWasEdited = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  UsuarioController _controller;
  Usuario novoUsuario = new Usuario();

  String _validarNome(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Nome é obrigatório';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Por favor, apenas caracteres alfabéticos.';
    return null;
  }

  String _validarTelefone(String value) {
    _formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(##) #####-#### - Digite um telefone válido';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: body,
      backgroundColor: CoresUtil.fundo,
    );
  }

  Widget get body {
    return new SafeArea(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50.0),
                Text(
                  's i m p l í',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 50,
                      color: CoresUtil.cinzaEscuro),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Investments made simple',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: CoresUtil.laranja),
                ),
                const SizedBox(height: 45.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Nome',
                  ),
                  validator: _validarNome,
                  onSaved: (valor) => novoUsuario.nome = valor,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (valor) => novoUsuario.email = valor,
                ),
                const SizedBox(height: 35.0),
                CustomButton(
                  descricao: 'Registrar',
                  target: _registrar,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          )),
    );
  }

  _registrar() async {
    _controller = new UsuarioController();
    _formKey.currentState.save();
    await _controller.registrar(novoUsuario).then((retorno){

      Navigator.of(context).pop();
    });
  }

}
