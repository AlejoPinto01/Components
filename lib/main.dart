import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes',
      home: HomePageTemp(),
    );
  }
}