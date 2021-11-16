import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    //_loadData();
  }

  Future<List<dynamic>> loadData() async {
    final resposta = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resposta);
    print(dataMap);
    opciones = dataMap['rutes'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
