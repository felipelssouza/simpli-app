import 'package:flutter/material.dart';
import 'package:simpli/feature/home/home_investimento.dart';
import 'package:simpli/feature/login/login_screen.dart';
import 'package:simpli/feature/login/pre_login.dart';

void main() => runApp(new Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'simpli',
      home: PreLogin(),
      routes: <String, WidgetBuilder>{
        '/pre_login': (BuildContext context) => new PreLogin(),
        '/login': (BuildContext context) => new LoginScreen(),
        '/home': (BuildContext context) => new HomeInvestimento(),
      },
    );
  }
}
