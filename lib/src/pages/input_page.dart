import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nom = '';
  String _email = '';
  String _data = '';
  String _pais = 'USA';
  bool _passwordVisible = true;
  var _userController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwController = TextEditingController();
  var _dateController = TextEditingController();
  List<String> _paises = [
    'USA',
    'Argentina',
    'Mexico',
    'España',
    'Francia',
    'Alemania',
    'Italia',
  ];

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
          _crearData(context),
          Divider(),
          crearDropdown(),
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
        suffixIcon: Icon(Icons.email),
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
        icon: Icon(Icons.lock),
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

  _crearData(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        icon: Icon(Icons.calendar_today),
        hintText: 'dd/mm/aaaa',
        labelText: 'Fecha de nacimiento',
      ),
      controller: _dateController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionarData(context);
      },
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nom'),
      subtitle: Text('Correo: $_email'),
      trailing: Text(_pais),
    );
  }

  Future<void> _seleccionarData(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      locale: Locale('es', 'ES'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _data = picked.toString();
        _dateController.text = _data;
      });
    }
  }

  Widget crearDropdown() {
    return Row(
      children: [
        Icon(Icons.language),
        SizedBox(width: 30),
        Expanded(
          child: DropdownButton(
            hint: Text('Country'),
            value: _pais,
            items: getOptionDropdown(),
            onChanged: (option) {
              setState(() {
                _pais = option as String;
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptionDropdown() {
    List<DropdownMenuItem<String>> llista = [];
    _paises.forEach(
      (element) {
        llista.add(
          DropdownMenuItem(
            child: Text(element),
            value: element,
          ),
        );
      },
    );
    return llista;
  }
}
