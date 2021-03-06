import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin  {

  AnimationController animationController;  

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animationController.addListener((){
      // print(animationController.value);
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, animationController.value);
      setState(() {
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if(nuevoPorcentaje > 100){
            nuevoPorcentaje = 0;
            nuevoPorcentaje = 0;
          }
          // nuevoPorcentaje = porcentaje;
          animationController.forward(from: 0.0);

          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter : _MiRadialProgress(porcentaje)
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    //circulo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    Offset center = new Offset(size.width*0.5, size.height/2);
    double radius  = min(size.width*0.5, size.height*0.5); 

    canvas.drawCircle(center, radius, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;
    // parte que que se debe llenar
    double arcAngle = 2*pi*(porcentaje/100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius:radius),
      -pi/2, 
      arcAngle, 
      false, 
      paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}