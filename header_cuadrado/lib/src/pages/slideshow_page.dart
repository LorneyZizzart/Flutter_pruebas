import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:header_cuadrado/src/widgets/slideshow.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {



  const SlideshowPage({Key key}) : super(key: key);

  @override
    Widget build(BuildContext context) {

      bool isLarge;
      if(MediaQuery.of(context).size.height > 500){
        isLarge = true;
      }else{
        isLarge = false;
      }

    final children = [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
        ];

    return Scaffold(
      // backgroundColor: Colors.red,
      body: (isLarge) ? Column(children: children,) : Row(children: children,)
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
    final appTheme = Provider.of<ThemeChanger>(context);
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 10,
      puntosArriba:false,
      colorPrimario: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Colors.pinkAccent,
      // colorPrimario: Colors.red,
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