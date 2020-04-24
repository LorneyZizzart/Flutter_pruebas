import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {

  bool _playing = false;

  Duration _soundDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  String get songTotalDuration => this.printDuration(this._soundDuration);
  String get currentSecond => this.printDuration(this._current);

  // Obtenemos en porcentaje
  double get porcentaje => (this._soundDuration.inSeconds == 0) ?  this._current.inSeconds / this._soundDuration.inSeconds : 0;

  AnimationController _controller;
  set controller(AnimationController valor){
    this._controller = valor;
  }
  AnimationController get controller => this._controller;

  bool get playing => this._playing;
  set playing (bool valor){
    this._playing = valor;
    notifyListeners();
  }

  Duration get songDuration => this._soundDuration;
  set songDuration(Duration valor){
    this._soundDuration = valor;
    notifyListeners();
  }

  Duration get current => this._current;
  set current(Duration valor){
    this._current = valor;
    notifyListeners();
  }
  // Nos deveuelve un string de la duracion
  String printDuration(Duration duration){
    String twoDigits(int n){
      if(n>= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inMinutes.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  
}