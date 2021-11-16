import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final elements = ['Element 1', 'Element 2', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3', 'Element 3'];
  //Iterable<T> map<T>(T toElement(E e)) => MappedIterable<E, T>(this, toElement);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(children: _crearElementsCurt()),
    );
  }

  List<Widget> _crearElements() {
    List<Widget> llista = [];
    for (String element in elements) {
      final tempWidget = ListTile(
        title: Text(element),
      );
      //final tempWidgetText = Text(element);
      llista.add(tempWidget);
      llista.add(Divider());
    }
    return llista;
  }

  List<Widget> _crearElementsCurt() {
    var widgets = elements.map((e) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              print('a');
            },
            title: Text(e + '!'),
            subtitle: Text(e + '?'),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.remove),
          ),
        ],
      );
    });

    return widgets.toList();
  }
}
