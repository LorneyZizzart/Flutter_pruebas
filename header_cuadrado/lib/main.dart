import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/pages/animaciones_page.dart';
import 'package:header_cuadrado/src/pages/graficas%20_circulares_page.dart';
import 'package:header_cuadrado/src/pages/header_page.dart';
import 'package:header_cuadrado/src/pages/pinterest_page.dart';
import 'package:header_cuadrado/src/pages/slideshow_page.dart';
import 'package:header_cuadrado/src/retos/cuadrado_animado_page.dart';

// import 'package:header_cuadrado/src/pages/header_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent
      ),
      title: 'Material App',
      initialRoute: 'pinteres',
      routes: {
         "animaciones": (BuildContext context) => AnimacionesPage(),
         "cuadradoAnimado": (BuildContext context) => CuadradoAnimadoPage(),
         "graficas": (BuildContext context) => GraficasCircularesPage(),
         "slideshow": (BuildContext context) => SlideshowPage(),
         "header": (BuildContext context) => HeadersPage(),
         "pinteres": (BuildContext context) => PinterestPage(),
      },
      // home: AnimacionesPage()
    );
  }
}