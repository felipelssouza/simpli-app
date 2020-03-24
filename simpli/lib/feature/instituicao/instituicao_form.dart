import 'package:flutter/material.dart';
import 'package:simpli/ui/custom_button.dart';
import 'package:simpli/feature/util/const.dart';
import 'package:simpli/ui/custom_header.dart';
import 'package:simpli/ui/password_field.dart';

class InstituicaoForm extends StatefulWidget {
  InstituicaoForm({Key key}) : super(key: key);

  @override
  _InstituicaoFormState createState() => new _InstituicaoFormState();
}

class _InstituicaoFormState extends State<InstituicaoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader('Cadastro de nova conta').build(context),
      body: body,
      backgroundColor: Colors.white,
    );
  }

  Widget get body {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Const.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 24.0),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Agência',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Conta',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24.0),
          PasswordField(
//            fieldKey: _passwordFieldKey,
            helperText: 'No mínimo 8 caracteres, maiúsculas e minúsculas',
            labelText: 'Senha eletrônica',
            onFieldSubmitted: (String value) {
              setState(() {
                //person.password = value;
              });
            },
          ),
          const SizedBox(height: 35.0),
          CustomButton(
            descricao: 'Cadastrar',
            target: _cadastrar,
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }

  _cadastrar() {
    return () => null;
    // TODO request
  }
}
