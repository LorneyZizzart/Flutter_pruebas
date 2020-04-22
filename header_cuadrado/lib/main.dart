import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/pages/animaciones_page.dart';
import 'package:header_cuadrado/src/pages/emergency_page.dart';
import 'package:header_cuadrado/src/pages/graficas%20_circulares_page.dart';
import 'package:header_cuadrado/src/pages/header_page.dart';
import 'package:header_cuadrado/src/pages/launchr_page.dart';
import 'package:header_cuadrado/src/pages/pinterest_page.dart';
import 'package:header_cuadrado/src/pages/sliderList_page.dart';
import 'package:header_cuadrado/src/pages/slideshow_page.dart';
import 'package:header_cuadrado/src/retos/cuadrado_animado_page.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:provider/provider.dart';

// import 'package:header_cuadrado/src/pages/header_page.dart';
 
void main() => runApp(
  ChangeNotifierProvider(child: MyApp(), create: (_) => ThemeChanger(2),)
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Material App',
      initialRoute: 'launcher',
      routes: {
         "animaciones": (BuildContext context) => AnimacionesPage(),
         "cuadradoAnimado": (BuildContext context) => CuadradoAnimadoPage(),
         "graficas": (BuildContext context) => GraficasCircularesPage(),
         "slideshow": (BuildContext context) => SlideshowPage(),
         "header": (BuildContext context) => HeadersPage(),
         "pinteres": (BuildContext context) => PinterestPage(),
         "emergencia": (BuildContext context) => EmergenciaPage(),
         "sliver": (BuildContext context) => SliverListPage(),
         "launcher": (BuildContext context) => LauncherPage(),
      },
      // home: AnimacionesPage()
    );
  }
}