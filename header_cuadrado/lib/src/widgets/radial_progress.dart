import 'dart:math';

import 'package:flutter/material.dart';

// LA FUNCION LISTA PARA SER LLAMADA

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  RadialProgress({
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue, this.colorSecundario = Colors.grey, this.grosorSecundario = 4.0, 
    this.grosorPrimario = 10
    });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  double porcentajeAnterior;

  @override
  void initState() {
    
    porcentajeAnterior = widget.porcentaje;

    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    animationController.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress((widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * animationController.value),
            widget.colorPrimario,
            widget.colorSecundario,            
            widget.grosorPrimario,
            widget.grosorSecundario,
            ),
          ),
        );
      },
    );


  }
}
//EL DIBUJO DEL CIRCULO CON EL RADIAL PORCENTAL
class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  final Color colorPrincipal;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje, 
    this.colorPrincipal, 
    this.colorSecundario, 
    this.grosorPrimario,
    this.grosorSecundario    
  );

  @override
  void paint(Canvas canvas, Size size) {

    //circulo completado
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;

    Offset center = new Offset(size.width*0.5, size.height/2);
    double radius  = min(size.width*0.5, size.height*0.5); 

    canvas.drawCircle(center, radius, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorPrincipal
      ..style       = PaintingStyle.stroke
      ..strokeCap   = StrokeCap.round;
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