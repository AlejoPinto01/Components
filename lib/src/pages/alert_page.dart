import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Alert'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Alert',
            style: TextStyle(fontSize: 15),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shape: StadiumBorder()),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'maricon maricon maricon maricon maricon maricon maricon maricon maricon maricon maricon maricon '),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar')),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK')),
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        );
      },
    );
  }
}
