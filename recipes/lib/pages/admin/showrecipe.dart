import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CommonThings {
  static Size size;
}

TextEditingController phoneinputController;
TextEditingController nameinputController;
String id;
final db = Firestore.instance;
String name;
String phone;

class InicioPage extends StatefulWidget {
  final String 
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}