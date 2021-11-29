import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nom = '';
  String _email = '';
  bool _passwordVisible = true;
  var _userController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwController = TextEditingController();

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
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.clear_all),
            onPressed: () {
              _userController.clear();
              _emailController.clear();
              _passwController.clear();
            },
          ),
        ],
      ),
    );
  }

  _createInput() {
    return TextField(
      //autofocus: true,
      //keyboardType: TextInputType(),
      controller: _userController,
      decoration: InputDecoration(
        labelText: 'Nombre de usuario',
        counter: Text('Letras: ${_nom.length}'),
        hintText: 'Inserta texto',
        helperText: 'Debe ser único',
        suffixIcon: Icon(Icons.input),
        icon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onChanged: (valor) {
        setState(() {
          _nom = valor;
          //print(_nom);
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Correo electrónico',
        hintText: 'ejemplo@gmail.com',
        suffixIcon: Icon(Icons.send),
        icon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      controller: _passwController,
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        hintText: '*******',
        helperText: 'Debe contener al menos 1 mayúscula y 1 número',
        icon: Icon(Icons.password),
        suffixIcon: IconButton(
          icon: _passwordVisible
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          color: _passwordVisible ? Colors.grey : Colors.amber,
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nom'),
      subtitle: Text('Correo: ${_email}'),
    );
  }
}
