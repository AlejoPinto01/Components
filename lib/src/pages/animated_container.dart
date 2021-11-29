import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: null,
          onPressed: () => _reset(),
          child: Icon(Icons.restore),
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: () => _randomContainer(),
          child: Icon(Icons.play_arrow),
        ),
      ],
    );
  }

  void _randomContainer() {
    setState(() {
      final random = Random();
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  void _reset() {
    setState(() {
      _width = 50;
      _height = 50;
      _color = Colors.pink;
      _borderRadius = BorderRadius.circular(10);
    });
  }
}