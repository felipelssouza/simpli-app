import 'package:flutter/material.dart';
import 'package:simpli/application/session.dart';
import 'package:simpli/feature/cadastro/usuario/model/usuario.dart';
import 'package:simpli/feature/cadastro/usuario/usuario_form.dart';
import 'package:simpli/feature/cadastro/usuario/usuario_nova_senha.dart';
import 'package:simpli/feature/home/home_investimento.dart';
import 'package:simpli/feature/login/controller/login_controller.dart';
import 'package:simpli/feature/login/model/login.dart';
import 'package:simpli/feature/util/cores_util.dart';
import 'package:simpli/feature/util/strings.dart';
import 'package:simpli/feature/util/validator_util.dart';
import 'package:simpli/ui/custom_button.dart';
import 'package:simpli/ui/custom_dialog.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  BuildContext _scaffoldContext;
  LoginController _loginController;
  bool _carregando = false;
  Login login = new Login();

  @override
  void initState() {
    super.initState();
  }

  Widget _montarLogin() {
    Widget body = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: montarBackgroud(),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50.0),
              Text(
                Strings.simpli,
                style: TextStyle(
                    fontFamily: Strings.fontePadrao,
                    fontSize: 50,
                    color: CoresUtil.fundo),
              ),
              const SizedBox(height: 15.0),
              Text(
                Strings.slogan,
                style: TextStyle(
                    fontFamily: Strings.fontePadrao,
                    fontSize: 20,
                    color: CoresUtil.laranja),
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: Strings.email,
                    contentPadding: EdgeInsets.all(20.0)),
                validator: (valor) =>
                    ValidatorUtil.validarEmail(valor),
                onSaved: (valor) => login.email = valor,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: Strings.senha,
                    contentPadding: EdgeInsets.all(20.0)),
                obscureText: true,
                validator: (valor) =>
                    ValidatorUtil.validarCampoTexto(valor, Strings.senha),
                onSaved: (valor) => login.senha = valor,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: new CustomButton(
                  descricao: 'Entrar',
                  target: _login,
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Novo acesso? ',
                  ),
                  InkWell(
                    child: Text(
                      'Crie sua conta',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 16,
                          color: CoresUtil.laranja),
                    ),
                    onTap: _abrirCadastroUsuario,
                  )
                ],
              ),
            ],
          ),
        ));

    var listaWidgets = new List<Widget>();
    listaWidgets.add(body);

    if (_carregando) {
      var modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.6,
            child: const ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(),
          ),
        ],
      );

      listaWidgets.add(modal);
    }

    return new Stack(
      children: listaWidgets,
    );
  }

  BoxDecoration montarBackgroud() {
    return new BoxDecoration(
        gradient: new LinearGradient(
            begin: FractionalOffset.topCenter,
            end: new FractionalOffset(0.5, 0.35),
            colors: [
          CoresUtil.verdeEscuroPadrao,
          CoresUtil.verdePadrao,
          CoresUtil.fundo
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: Builder(builder: (BuildContext context) {
      _scaffoldContext = context;
      return _montarLogin();
    }));
  }

  _login() async {
    _loginController = new LoginController();
    FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _carregando = true;
      });
      await _loginController.login(login).then((loginResponse) {
        setState(() {
          _carregando = false;
        });
        if (loginResponse != null) {
          if (loginResponse.trocaSenha) {
            _abrirDialog();
          } else {
            Session.usuario = loginResponse.usuario;
            _abrirHome();
          }
        }
      }).catchError((erro) {
        setState(() {
          _carregando = false;
        });
        _exibeErro(erro);
      });
    }
  }

  _abrirHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeInvestimento()));
  }

  _abrirDialog() {
    showDialog(
        context: context,
        builder: (_) => CustomDialog(
            'Primeiro acesso!',
            'Você precisa alterar a senha antes de acessar.',
            _abrirTrocaSenha));
  }

  _abrirCadastroUsuario() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsuarioForm()));
  }

  _abrirTrocaSenha() {
    Navigator.of(context).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsuarioNovaSenha()));
  }

  _exibeErro(erro) {
    Scaffold.of(_scaffoldContext).showSnackBar(SnackBar(
      content: Text(erro.toString()),
      duration: Duration(seconds: 5),
    ));
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
