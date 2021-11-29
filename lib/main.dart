import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes',
      //home: HomePage(),
      initialRoute: '/',
      routes: getRutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Hemos ido a: ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
