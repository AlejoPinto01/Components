import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_providers.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _llista(),
    );
  }

  Widget _llista() {
    //menuProvider.carregarDades()
    return FutureBuilder(
      future: menuProvider.carregarDades(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        print('builder');
        print(snapshot.data);
        return ListView(
          children: _llistaElements(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _llistaElements(BuildContext context, List<dynamic>? data) {
    final List<Widget> elements = [];
    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texte']),
        leading: getIcon(element['icona']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      elements.add(widgetTemp);
      elements.add(Divider());
    });
    return elements;
  }
}
