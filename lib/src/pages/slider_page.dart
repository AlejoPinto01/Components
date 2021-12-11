import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 40;
  bool _valorCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Container(
      child: Slider(
        value: _valorSlider,
        min: 10,
        max: 400,
        label: 'Tamaño imagen',
        activeColor: Colors.indigo,
        //thumbColor: Colors.amber,
        //inactiveColor: Colors.red,
        divisions: 10,
        onChanged: (_valorCheckbox)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              },
      ),
      padding: EdgeInsets.only(top: 50),
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://p.kindpng.com/picc/s/176-1766643_come-to-the-dart-side-flutter-custom-bottom.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _valorCheckbox,
      onChanged: (estado) {
        setState(() {
          _valorCheckbox = estado!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _valorCheckbox,
      onChanged: (estado) {
        setState(() {
          _valorCheckbox = estado!;
        });
      },
    );
  }
}
