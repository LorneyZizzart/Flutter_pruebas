import 'package:flutter/material.dart';
import 'package:prueba2/src/pages/contador_page.dart';
//
// import 'package:prueba2/src/pages/home_page.dart';
class MyApp  extends StatelessWidget{
  @override
  Widget build(contex){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        // child: HomePage(),
        child: ContadorPage(),
      ) 
    );
  }
}