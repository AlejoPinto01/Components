import 'dart:async';

import 'package:flutter/material.dart';

class LlistaPage extends StatefulWidget {
  @override
  _LlistaPageState createState() => _LlistaPageState();
}

class _LlistaPageState extends State<LlistaPage> {
  List<int> _llistaNombres = [];
  int _darrerItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _hideButton = true;
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregaNou();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels > 400) {
        _hideShowButton(false);
      }
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Inicio');
          _hideShowButton(true);
        } else {
          print('final');
          //_carregaNou();
          fetchData();
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: [
        _crearLista(),
        _createLoading(),
      ]),
      floatingActionButton: _hideButton
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () => _toTop(),
            ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _llistaNombres[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/id/${imagen}/500/400'));
        },
        itemCount: _llistaNombres.length,
      ),
    );
  }

  void _carregaNou() {
    for (var i = 0; i < 5; i++) {
      _llistaNombres.add(_darrerItem);
      _darrerItem++;
    }
  }

  void _toTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      //curve: Curves.easeOutCirc,
      curve: Curves.easeOutQuint,
    );
  }

  void _hideShowButton(bool hide) {
    setState(() {
      _hideButton = hide;
    });
  }

  Future<Timer> fetchData() async {
    _loading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return Timer(duration, peticionHTTP);
  }

  void peticionHTTP() {
    _loading = false;
    _carregaNou();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _createLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15)
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _llistaNombres.clear();
      _darrerItem++;
      _carregaNou();
    });
    return Future.delayed(duration);
  }
}
