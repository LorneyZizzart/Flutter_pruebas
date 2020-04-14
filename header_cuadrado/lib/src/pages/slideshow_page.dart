import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/widgets/slideshow.dart';

import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {



  const SlideshowPage({Key key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Column(
        children: <Widget>[
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
        ],
      )
    );
  }

// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // backgroundColor: Colors.red,
  //     body: Slideshow(
  //       bulletPrimario: 15,
  //       bulletSecundario: 10,
  //       puntosArriba:false,
  //       colorPrimario: Colors.pinkAccent,
  //       colorSecundario: Colors.grey,
  //       slides: <Widget>[
  //         SvgPicture.asset('assets/svg/1.svg'),
  //         SvgPicture.asset('assets/svg/2.svg'),
  //         SvgPicture.asset('assets/svg/3.svg'),
  //         SvgPicture.asset('assets/svg/4.svg'),
  //         SvgPicture.asset('assets/svg/5.svg'),
  //         //TODO: lo que tambien podemos agregar
  //         // Text('Hola Mundo'),
  //         // Container(
  //         //   width: double.infinity,
  //         //   height: double.infinity,
  //         //   color: Colors.blue,
  //         // )
  //       ],
  //     )
  //   );
  // }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 10,
      puntosArriba:false,
      colorPrimario: Colors.pinkAccent,
      colorSecundario: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/1.svg'),
        SvgPicture.asset('assets/svg/2.svg'),
        SvgPicture.asset('assets/svg/3.svg'),
        SvgPicture.asset('assets/svg/4.svg'),
        SvgPicture.asset('assets/svg/5.svg'),
      ],
    );
  }
}