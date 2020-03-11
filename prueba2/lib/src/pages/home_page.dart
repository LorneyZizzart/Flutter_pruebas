import 'package:flutter/material.dart';
class HomePage extends StatelessWidget{


  final sizeFont = new TextStyle(fontSize: 20);

  final conteo = 10;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First app'),
        centerTitle: false
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks', style: sizeFont),
            Text('$conteo', style: sizeFont)
          ],
        ),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print('Hola Mundo');
          } ,
          
        ),
      
    );
  }
}