import 'package:flutter/material.dart';
import 'package:simpli/feature/util/const.dart';
import 'package:simpli/feature/util/cores_util.dart';
import 'package:simpli/ui/custom_button.dart';
import 'package:simpli/ui/custom_header.dart';

class SucessoNovaSenha extends StatefulWidget {
  SucessoNovaSenha({Key key}) : super(key: key);

  @override
  _SucessoNovaSenhaState createState() => new _SucessoNovaSenhaState();
}

class _SucessoNovaSenhaState extends State<SucessoNovaSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader('Nova senha').build(context),
      body: body,
      backgroundColor: Colors.white,
    );
  }

  Widget get body {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Const.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Cadastro realizado com sucesso!'),
            const SizedBox(
              height: 24,
            ),
            Text('Você receberá um e-mail com a senha temporária.'),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              cor: CoresUtil.verdePadrao,
              descricao: 'Voltar',
              target: _voltar,
            )
          ],
        ));
  }

  _voltar() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/pre_login'));
  }
}
