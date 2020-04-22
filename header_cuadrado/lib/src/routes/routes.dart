import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:header_cuadrado/src/pages/slideshow_page.dart';
import 'package:header_cuadrado/src/pages/emergency_page.dart';
import 'package:header_cuadrado/src/pages/graficas%20_circulares_page.dart';
import 'package:header_cuadrado/src/pages/header_page.dart';
import 'package:header_cuadrado/src/pages/pinterest_page.dart';
import 'package:header_cuadrado/src/pages/sliderList_page.dart';
import 'package:header_cuadrado/src/retos/cuadrado_animado_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergenciaPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezado', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de Progreso', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterst', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}