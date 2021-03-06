import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  final Color color;

  const HearderCurvo({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          // color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _HearderCurvoPainter(this.color),
          ),
    );
  }
}

class _HearderCurvoPainter extends CustomPainter {

  final Color color;

  _HearderCurvoPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //propiedades
    // paint.color = Color(0xff615AAB);
    paint.color = color;
    // paint.style = PaintingStyle.stroke; // stroke que son los border y .fill es el relleno
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


class IconHeader  extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({Key key,@required  this.icon, @required this.titulo, @required this.subtitulo, this.color1 = Colors.grey, this.color2 = Colors.blueGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(color1: color1, color2: color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size: 250, color: Colors.white.withOpacity(0.2),),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity,),
            Text(this.subtitulo, style: TextStyle(fontSize: 20, color: colorBlanco), ),
            SizedBox(height: 20,),
            Text(this.titulo, style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold), ),
            FaIcon(this.icon, size: 80, color: Colors.white,)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    Key key, this.color1, this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            this.color1,
            this.color2
          ]
        )
      ),
    );
  }
}
