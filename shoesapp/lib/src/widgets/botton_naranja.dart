import 'package:flutter/material.dart';

class BottonNaranja extends StatelessWidget {

  final String texto;

  const BottonNaranja({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 155,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text('$texto', style: TextStyle(color: Colors.white),),
    );
  }
}