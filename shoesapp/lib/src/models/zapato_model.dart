import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assets = 'assets/azul.png';
  double _talla = 9.0;

  String get assetsImage => this._assets;
  set assetsImage (String valor){
    this._assets = valor;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla (double valor){
    this._talla = valor;
    notifyListeners();
  }
  
}