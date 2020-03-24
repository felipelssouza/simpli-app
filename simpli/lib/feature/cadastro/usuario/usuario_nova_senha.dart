import 'package:flutter/material.dart';
import 'package:simpli/feature/cadastro/usuario/model/nova_senha.dart';
import 'package:simpli/feature/cadastro/usuario/sucesso_nova_senha.dart';
import 'package:simpli/feature/util/cores_util.dart';
import 'package:simpli/ui/custom_button.dart';
import 'package:simpli/ui/password_field.dart';

class UsuarioNovaSenha extends StatefulWidget {
  UsuarioNovaSenha({Key key}) : super(key: key);

  @override
  _UsuarioNovaSenhaState createState() => new _UsuarioNovaSenhaState();
}

class _UsuarioNovaSenhaState extends State<UsuarioNovaSenha> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  NovaSenha dadosRequest = new NovaSenha();

  @override
  Widget build(BuildContext context) {
    Widget body = new SafeArea(
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
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText: 'No mínimo 8 caracteres, maiúsculas e minúsculas',
                  labelText: 'Senha antiga',
                  onFieldSubmitted: (String valor) {
                    setState(() {
                      dadosRequest.senha = valor;
                    });
                  },
                ),
                const SizedBox(height: 24.0),
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText: 'No mínimo 8 caracteres, maiúsculas e minúsculas',
                  labelText: 'Nova senha',
                  onFieldSubmitted: (String valor) {
                    setState(() {
                      dadosRequest.senha = valor;
                    });
                  },
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  obscureText: true,
                  validator: _validarSenha,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Confirmar nova senha',
                  ),
                ),
                const SizedBox(height: 35.0),
                CustomButton(
                  descricao: 'Alterar',
                  target: _exibeSucesso,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          )),
    );

    return Scaffold(
      key: _scaffoldKey,
      body: body,
      backgroundColor: CoresUtil.fundo,
    );
  }

  String _validarSenha(String value) {
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Por favor digite a senha.';
    if (passwordField.value != value) return 'As senhas estão diferentes.;';
    if (passwordField.value.length < 8)
      return 'No mínimo 8 caracteres para a senha.';
    return null;
  }

  _exibeSucesso() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SucessoNovaSenha()));
  }
}
