import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Avatar'),
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.discordapp.com/attachments/879141473717727312/914578246501281842/Logo_Smash_Mallorca.png'),
              //radius: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('JC'),
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://cdn.discordapp.com/attachments/879141473717727312/914578246501281842/Logo_Smash_Mallorca.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
