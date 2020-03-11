import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{
  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State <ContadorPage>{

  final _sizeFont = new TextStyle(fontSize: 20);

  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First2 app'),
        centerTitle: false
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks', style: _sizeFont),
            Text('$_conteo', style: _sizeFont)
          ],
        ),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _crearBotones()
      
    );
  }

  Widget _crearBotones(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      SizedBox(width: 30.0),
      FloatingActionButton( 
        onPressed: _reset,
        child: Icon(Icons.exposure_zero),
      ),
      Expanded(child: SizedBox()),
      FloatingActionButton( 
        onPressed: _sustraer,
        child: Icon(Icons.remove),
      ),
      SizedBox(width: 5.0,),
      FloatingActionButton( 
        onPressed: _agregar,
        child: Icon(Icons.add),
      )
      ],
    );
  }

  void _agregar() {
    setState(() => _conteo++);
  }

  void _sustraer(){
  setState(() => _conteo--);
  }

  void _reset(){
    setState(() => _conteo = 0);
  }

}