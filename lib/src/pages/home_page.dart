import 'package:componentes/src/providers/menu_providers.dart';
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
}

Widget _llista() {
  // menuProvider.loadData().then((data) {
  //   print('Llista');
  //   print(data);
  // });
  return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print('builder');
        print(snapshot.data);
        return ListView(
          children: _llistaElements(snapshot.data),
        );
      });
}

List<Widget> _llistaElements(List<dynamic>? data) {
  final List<Widget> elements = [];
  data?.forEach((element) {
    final widgetTemp = ListTile(
      title: Text(element['texte']),
      leading: Icon(
        Icons.account_circle,
        color: Colors.blue,
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      onTap: () {},
    );
    elements.add(widgetTemp);
    elements.add(Divider());
  });
  return elements;
}
