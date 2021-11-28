import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _createInput(),
        ],
      ),
    );
  }

  _createInput() {
    return TextField(
      //autofocus: true,
      //keyboardType: TextInputType(),
      decoration: InputDecoration(
        labelText: 'Nombre de usuario',
        counter: Text('Letras: 0'),
        hintText: 'Inserta texto',
        helperText: 'Debe ser único',
        suffixIcon: Icon(Icons.text_fields),
        icon: Icon(Icons.account_circle),
      ),
    );
  }
}
