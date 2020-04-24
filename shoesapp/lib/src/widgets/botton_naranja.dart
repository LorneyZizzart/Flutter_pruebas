import 'package:flutter/material.dart';

class BottonNaranja extends StatelessWidget {

  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  const BottonNaranja({Key key, this.texto, this.alto = 50, this.ancho = 150, this.color = Colors.orange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text('$texto', style: TextStyle(color: Colors.white),),
    );
  }
}