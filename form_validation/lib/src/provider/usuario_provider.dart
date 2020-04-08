import 'dart:convert';

import 'package:form_validation/src/preferencias/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
class UsuarioProvider {
  final String firebaseToken='AIzaSyAjTrR5lp3QCFI4JGC2lM9J8CoybPWytx4';
  final _preferecias = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async{
    final authData = {
      'email' : email,
      'password' : password,
      'returSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseToken',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp.containsKey('idToken')){
      _preferecias.token =  decodedResp['idToken'];
      return {'ok': true, 'message' : decodedResp['idToken']};
    }else{
      return {'ok': false, 'message' : decodedResp['error']['message']};  //buscar en error el message
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async{
    final authData = {
      'email' : email,
      'password' : password,
      'returSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseToken',
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if(decodedResp.containsKey('idToken')){
      _preferecias.token =  decodedResp['idToken'];
      return {'ok': true, 'message' : decodedResp['idToken']};
    }else{
      return {'ok': false, 'message' : decodedResp['error']['message']};  //buscar en error el message
    }
  }
}