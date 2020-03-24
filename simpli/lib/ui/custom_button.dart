import 'package:flutter/material.dart';
import 'package:simpli/feature/util/cores_util.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.descricao, this.cor = CoresUtil.verdePadrao, this.target});

  final String descricao;
  final Color cor;
  final double elevation = 10.0;
  final VoidCallback target;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: cor,
      elevation: elevation,
      child: Text(
        descricao,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: target,
      padding: EdgeInsets.fromLTRB(45.0, 15.0, 45.0, 15.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
    );
  }
}
