import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  Future submit () async {
    log(_email);
    log(_password);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesion'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    hintText: 'correo@dominio.com',
                  ),
                  onSaved: (value) => {
                    _email = value
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  onSaved: (value) => {
                    _password = value
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Iniciar Sesion'),
                    onPressed: () {
                      _formKey.currentState.save();

                      this.submit();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}