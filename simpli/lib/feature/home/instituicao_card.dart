import 'package:flutter/material.dart';
import 'package:simpli/feature/instituicao/model/instituicao.dart';

class InstituicaoCard extends StatefulWidget {
  final Instituicao instituicao;
  final VoidCallback target;
  final bool exibeSaldo;

  InstituicaoCard(this.instituicao, this.target, this.exibeSaldo);

  @override
  _InstituicaoCardState createState() =>
      _InstituicaoCardState(instituicao, target, exibeSaldo);
}

class _InstituicaoCardState extends State<InstituicaoCard> {
  Instituicao instituicao;
  VoidCallback target;
  bool exibeSaldo = false;

  _InstituicaoCardState(this.instituicao, this.target, this.exibeSaldo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          card,
        ],
      ),
    );
  }

  Widget get imagemInstituicao {
    return Container(
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/${instituicao.asset}.png'),
        ),
      ),
    );
  }

  Widget get card {
    return Container(
      child: new GestureDetector(
        onTap: target,
        child: Card(
            elevation: 8.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  imagemInstituicao,
                  Text(
                    widget.instituicao.nome,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  Column(
                    children: <Widget>[
                      _texto('${instituicao.porcentagem}', 18),
                      _texto('R\$ ${widget.instituicao.saldoBruto}', 18),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            )),
      ),
    );
  }

  Text _texto(String texto, double tamanho) {
    if (exibeSaldo) {
      return new Text(texto, style: TextStyle(fontSize: tamanho));
    }
    return new Text('');
  }
}
