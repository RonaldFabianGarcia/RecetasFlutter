import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes/auth/auth.dart';
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
  final String id;
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  InicioPage({this.auth,this.onSignedOut,this.id});
  
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  String userID;
  @override
  void initState() {
    setState(() {
     Auth().currentUser().then((onValue){
       userID = onValue;
       print("User id $userID");
     }); 
    });        
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}