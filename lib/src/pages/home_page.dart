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
  return ListView(
    children: [
      //_llistaElements(),
    ],
  );
}

List<Widget> _llistaElements() {
  return [
    ListTile(
      title: Text('a'),
    )
  ];
}
