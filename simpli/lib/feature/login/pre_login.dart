import 'package:flutter/material.dart';
import 'package:simpli/feature/login/login_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simpli/feature/util/cores_util.dart';

class PreLogin extends StatefulWidget {
  PreLogin({Key key}) : super(key: key);

  @override
  _PreLoginState createState() => new _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  final cor_inicio = CoresUtil.verdeEscuroPadrao;
  final cor_fim = CoresUtil.verdePadrao;

  Widget montarPreLogin() {
    Widget body = Container(
      decoration: montarBackgroud(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            's i m p l í',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 70,
                color: const Color(0xFFF6F9F9)),
          )),
          Center(
              child: Text(
            'Investments made simple',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 28,
                color: const Color(0xFFF38148)),
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: Center(
              child: OutlineButton(
                onPressed: () => _abrirLogin(),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                borderSide: BorderSide(color: Colors.white),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0)),
                child: Text('Iniciar',
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
          )
        ],
      ),
    );

    return new Scaffold(
      body: body,
    );
  }

  BoxDecoration montarBackgroud() {
    return new BoxDecoration(
        gradient: new LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [cor_inicio, cor_fim]));
  }

  @override
  Widget build(BuildContext context) {
    return montarPreLogin();
  }

  _abrirLogin() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.downToUp, child: LoginScreen()));
  }
}
