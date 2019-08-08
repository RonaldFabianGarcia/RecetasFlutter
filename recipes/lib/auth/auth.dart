import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:recipes/model/user_model.dart';

abstract class BaseAuth{
  Future<String> signInEmailPassword(String email,String password);
  Future<String> signUpEmailPassword(Usuario usuario);
  Future<void> signOut();
  Future<String> currentUser();
  Future<FirebaseUser> infoUser();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<String> signInEmailPassword(String email, String password) async{
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email,password: password);
    return user.uid;
  }
  @override
  Future<String> signUpEmailPassword(Usuario usuarioModel) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: usuarioModel.email,password: usuarioModel.password);

    UserUpdateInfo usuario = UserUpdateInfo();
    usuario.displayName = usuarioModel.nombre;
    await user.updateProfile(usuario);
    await user.sendEmailVerification().then((onValue)=>print('Email de verificacion enviado'))
          .catchError((onError)=>print('error de Email de verificacion: ${user.uid}'));
    
    await Firestore.instance.collection('Usuarios').document('${user.uid}').setData(
      {
        'nombre':usuarioModel.nombre,
        'telefono':usuarioModel.telefono,
        'email':usuarioModel.email,  
        'ciudad':usuarioModel.ciudad,  
        'direccion':usuarioModel.direccion
      }
    ).then((onValue)=>print("Usuario registrado en la BD"))
     .catchError((onError)=>print("Error en registrar el usuario en la bd"));
    return user.uid;
  }
  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
  @override
  Future<String> currentUser() async{
     FirebaseUser user = await _firebaseAuth.currentUser();
     String userId = user !=null ? user.uid : 'no_login';     
     return userId;
  }

  @override
  Future<FirebaseUser> infoUser() async{
     FirebaseUser user = await _firebaseAuth.currentUser();
     String userId = user !=null ? user.uid : 'No se pudo recuperar el usuario';
     print('recuperando usuario + $userId');     
     return user;
  }

  

  

  
}