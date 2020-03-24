import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:simpli/feature/home/donut_pie_chart.dart';
import 'package:simpli/feature/home/instituicao_card.dart';
import 'package:simpli/feature/instituicao/lista_instituicao.dart';
import 'package:simpli/feature/instituicao/model/instituicao.dart';
import 'package:simpli/feature/investimento/controller/investimento_controller.dart';
import 'package:simpli/ui/custom_button.dart';
import 'package:simpli/ui/custom_header.dart';

class HomeInvestimento extends StatefulWidget {
  HomeInvestimento({Key key}) : super(key: key);

  @override
  _HomeInvestimentoState createState() => new _HomeInvestimentoState();
}

class _HomeInvestimentoState extends State<HomeInvestimento> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  List<Instituicao> lista;
  InvestimentoController _controller;

  @override
  initState() {
    super.initState();
    _getListaInvestimentoInstituicao();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CustomHeader('Meus investimntos').build(context),
      body: body,
      backgroundColor: Colors.white,
    );
  }

  Widget get body {
    if (lista != null) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 24.0),
                _obterGrafico(),
                SizedBox(height: 24.0),
              ],
            ),
          ),
          SliverList(delegate: listaInstituicoes),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 24.0),
              Center(
                child: CustomButton(
                  descricao: 'Cadastrar nova instituição',
                  target: () => _cadastrarNovaInstituicao(),
                ),
              ),
              SizedBox(height: 24.0),
            ]),
          )
        ],
      );
    }
    return new Container();
  }

  SliverChildBuilderDelegate get listaInstituicoes {
    if (lista != null) {
      return SliverChildBuilderDelegate((BuildContext context, int index) {
        final item = lista[index];
        return InstituicaoCard(item, null, true);
      }, childCount: lista.length);
    }
    return new SliverChildBuilderDelegate((BuildContext context, int index) {});
  }

  Container _obterGrafico() {
    return new Container(
        height: 200, width: 200, child: new DonutPieChart.withSampleData());
  }

  _cadastrarNovaInstituicao() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListaInstituicao()));
  }

  void _getListaInvestimentoInstituicao() async {
    _controller = new InvestimentoController();
    await _controller.listarConsolidadoPorInstituicao('1').then((list) {
      setState(() {
        lista = list.instituicoes;
      });
    });
  }
}
