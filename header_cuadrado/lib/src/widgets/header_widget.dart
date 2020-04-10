import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          // color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _HeaderDiagonalPainter(),
          ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; // stroke que son los border y .fill es el relleno
    paint.style = PaintingStyle.fill; // stroke que son los border y .fill es el relleno
    paint.strokeWidth = 20;
    
    final path = new Path();
    //Dibujar con el path y el paint
    path.moveTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height*0.5);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          // color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _HeaderTriangularPainter(),
          ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; // stroke que son los border y .fill es el relleno
    paint.style = PaintingStyle.fill; // stroke que son los border y .fill es el relleno
    paint.strokeWidth = 20;
    
    final path = new Path();
    //Dibujar con el path y el paint
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo( size.height, 0);
    // path.lineTo(0, 0);
    // path.lineTo(0, size.height*0.5);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          // color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _HeaderPicoPainter(),
          ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; // stroke que son los border y .fill es el relleno
    paint.style = PaintingStyle.fill; // stroke que son los border y .fill es el relleno
    paint.strokeWidth = 20;
    
    final path = new Path();
    //Dibujar con el path y el paint
    path.moveTo(0, 0);
    path.lineTo(0, size.height*0.2);
    path.lineTo(size.width*0.5, size.height*0.3);
    path.lineTo(size.width, size.height*0.2);
    path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.lineTo(0, size.height*0.5);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

class HearderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          // color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _HearderCurvoPainter(),
          ),
    );
  }
}

class _HearderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.stroke; // stroke que son los border y .fill es el relleno
    paint.style = PaintingStyle.fill; // stroke que son los border y .fill es el relleno
    paint.strokeWidth = 20;
    
    final path = new Path();
    //Dibujar con el path y el paint
    path.moveTo(0, 0);
    path.lineTo(0, size.height*0.25);
    // path.lineTo(size.width, size.height*0.25);
    path.quadraticBezierTo(size.width*0.5, size.height*0.4, size.width, size.height*0.25);
    path.lineTo(size.width, 0);



    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

class HeaderWaves extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          // color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _HeaderWavesPainter(),
          ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.stroke; // stroke que son los border y .fill es el relleno
    paint.style = PaintingStyle.fill; // stroke que son los border y .fill es el relleno
    paint.strokeWidth = 20;
    
    final path = new Path();
    //Dibujar con el path y el paint

    // waves arriba
    // path.moveTo(0, 0);
    // path.lineTo(0, size.height*0.25);
    // path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.25);
    // path.quadraticBezierTo(size.width*0.75, size.height*0.15, size.width, size.height*0.25);
    // path.lineTo(size.width, 0);

    // waves abajo
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.75);
    path.quadraticBezierTo(size.width*0.25, size.height*0.65, size.width*0.5, size.height*0.75);
    path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.75);
    path.lineTo(size.width, size.height);



    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

