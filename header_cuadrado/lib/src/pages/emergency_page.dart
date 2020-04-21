import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:header_cuadrado/src/widgets/botton_gordo.dart';
import 'package:header_cuadrado/src/widgets/header_widget.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergenciaPage extends StatelessWidget {
  const EmergenciaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
        new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
        new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
        new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
        new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
        new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
        new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
        new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
        new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
        new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
        new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
        new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
        new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      ];

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        // duration: Duration(milliseconds: 250),
        child: BottonGordo(icon: item.icon, texto: item.texto, color1: item.color1, color2: item.color2, onPress: (){print('Hola');})),
    ).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(), // el azul de abajo al llegar al final
              children: <Widget>[
                SizedBox(height: 80,),
                // _BottonGordeTemp(),
                ...itemMap
              ],
            ),
          ),
          _Encabezado()
        ],
      )
    );
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(icon: FontAwesomeIcons.plus, titulo: 'Asistencia Médica', subtitulo: 'Haz solicitado',color1: Color(0xff526bf6), color2: Color(0xff67ACF2),),
        Positioned(
          top: 40,
          right: 0,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)),)
      ],
    );
  }
}

class _BottonGordeTemp extends StatelessWidget {
  const _BottonGordeTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottonGordo(icon: FontAwesomeIcons.carCrash, texto: 'Motor Accident', color1: Color(0xff6989F5), color2: Color(0xff906EF5), onPress: (){print('object');},);
  }
}

class _HeaderPage extends StatelessWidget {
  const _HeaderPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz solicitado',
      titulo: 'Asistencia médica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67ACF2),
    );
  }
}