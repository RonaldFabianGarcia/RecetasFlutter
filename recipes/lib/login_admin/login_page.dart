import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes/auth/auth.dart';

class LoginPage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignIn;
  LoginPage({this.auth,this.onSignIn});

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType {login,registro}
enum SelectSource {camara,galeria}
class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _nombre;
  String _telefono;
  String _itemCiudad;
  String _direccion;
  String _urlFoto = '';
  String usuario;

  bool _obscureText = true;
  FormType _formType = FormType.login;
  List<DropdownMenuItem<String>> _ciudadItems;

  @override
  void initState() {
    super.initState();
    _ciudadItems = getCiudadItems();
    _itemCiudad = _ciudadItems[0].value;
  }

  getData() async {
    return await Firestore.instance.collection("ciudades").getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}