import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(this.titulo, this.conteudo, this.target);

  final String titulo;
  final String conteudo;
  final VoidCallback target;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Text(conteudo),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar')),
        FlatButton(onPressed: target, child: Text('OK'))
      ],
    );
  }
}
