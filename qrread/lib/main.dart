import 'package:flutter/material.dart';
import 'package:qrread/src/pages/home_page.dart';
import 'package:qrread/src/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'mapa' : (BuildContext context) => MapaPage(),
      },
      theme: ThemeData( //Cambia el theme color de la app
        primaryColor: Colors.deepPurple
      ),
    );
  }
}