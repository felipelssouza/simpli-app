import 'package:flutter/material.dart';
import 'package:simpli/feature/util/cores_util.dart';

class CustomHeader extends StatelessWidget {
  final String texto;

  CustomHeader(this.texto);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titulo,
      elevation: 5,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: descricao,
      ),
      bottom: PreferredSize(
          child: new Container(), preferredSize: Size.fromHeight(80.0)),
      automaticallyImplyLeading: false,
      backgroundColor: CoresUtil.fundo,
    );
  }

  Widget get titulo {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              's i m p l í',
              style: TextStyle(fontSize: 30.0, color: CoresUtil.cinzaEscuro),
            ),
            Icon(
              Icons.info,
              color: CoresUtil.verdePadrao,
              size: 30.0,
            ),
          ],
        ));
  }

  Text get descricao {
    return Text(texto,
        style: TextStyle(fontSize: 20, color: CoresUtil.cinzaEscuro));
  }
}
