import 'package:flutter/material.dart';
import 'package:simpli/feature/home/instituicao_card.dart';
import 'package:simpli/feature/instituicao/controller/instituicao_controller.dart';
import 'package:simpli/feature/instituicao/instituicao_form.dart';
import 'package:simpli/feature/instituicao/model/instituicao.dart';
import 'package:simpli/feature/util/const.dart';
import 'package:simpli/ui/custom_header.dart';

class ListaInstituicao extends StatefulWidget {
  ListaInstituicao({Key key}) : super(key: key);

  @override
  _ListaInstituicaoState createState() => new _ListaInstituicaoState();
}

class _ListaInstituicaoState extends State<ListaInstituicao> {
  List<Instituicao> lista;
  InstituicaoController _controller;

  @override
  initState() {
    super.initState();
    _getListaInstituicao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader('Instituições financeiras').build(context),
      body: body,
      backgroundColor: Colors.white,
    );
  }

  Widget get body {
    if (lista != null) {
      return new Container(
          padding: EdgeInsets.symmetric(horizontal: Const.padding),
          child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final item = lista[index];
                return InstituicaoCard(item, _abrirForm, false);
              }));
    }
    // TODO: implementar empty state
    return new Container();
  }

  _abrirForm() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InstituicaoForm()));
  }

  void _getListaInstituicao() async {
    _controller = new InstituicaoController();
    await _controller.listar().then((list) {
      setState(() {
        lista = list.instituicoes;
      });
    });
  }
}
