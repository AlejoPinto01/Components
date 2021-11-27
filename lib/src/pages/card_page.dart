import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardTipus1(),
          SizedBox(
            height: 30,
          ),
          _cardTipus2()
        ],
      ),
    );
  }

  _cardTipus1() {
    return Card(
        elevation: 10,
        shadowColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Prueba'),
            subtitle: Text('Prueba de subtitulo'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('OK')),
              TextButton(onPressed: () {}, child: Text('Cancel'))
            ],
          )
        ]));
  }

  _cardTipus2() {
    final tarjeta = Card(
      //clipBehavior: Clip.antiAlias,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://d3isma7snj3lcx.cloudfront.net/images/news/30/3050832215/minecraft-dans-super-smash-bros-ce-sera-le-14-octobre-9dc8bb08.jpg'),
            fadeInDuration: Duration(milliseconds: 100),
            height: 250,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('Minecraft Kirby'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
    return Container(
        child: ClipRRect(
          child: tarjeta,
          borderRadius: BorderRadius.circular(100.0),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0), color: Colors.red));
  }
}
