import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          _crearImagen(),
          _crarTitulo(),
          _crearAcciones(),
          _creatTexto(),
          _creatTexto(),
          _creatTexto(),
          _creatTexto(),
          _creatTexto(),
          _creatTexto(),
        ],
        ),
      )
    );
  }

  Widget _crearImagen(){
    return Container(
      width: double.infinity, //se expande
      child: Image(
              image: NetworkImage('https://www.dzoom.org.es/wp-content/uploads/2017/07/seebensee-2384369-810x540.jpg'),
              height: 200.0,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _crarTitulo() {
    return SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Paisajes con un lago', style: estiloTitulo,),
                      SizedBox(height: 7.0,),
                      Text('Paisajes con un lago y montes', style: estiloSubTitulo,),
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.red,size: 30.0,),
                Text('41', style: TextStyle(fontSize: 20.0),)
              ],),
            ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //distribuye de manera proposcionar en un row
      children: <Widget>[
      _accion(Icons.call, 'Call'),
      _accion(Icons.near_me, 'Route'),
      _accion(Icons.share, 'Share')
    ],);
  }

  Widget _accion(IconData icon, String texto){
    return Column(children: <Widget>[
        Icon(icon, color: Colors.blue,size: 40.0,),
        SizedBox(height: 5.0,),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),)
      ],);
  }

  Widget _creatTexto(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:40.0, vertical: 20.0),
      child: Text('Yo os las entrego tales como son, en su frescor de carne y de rosa. Sólo existe un método honrado y lógico de traducción: la «literalidad», una literalidad impersonal, apenas atenuada por un leve parpadeo y una ligera sonrisa del traductor. Ella crea, sugestiva, la más grande potencia literaria. Ella produce el placer de la evocación. Ella es la garantía de la verdad. Ella es firme e inmutable, en su desnudez de piedra. Ella cautiva el aroma primitivo y lo cristaliza. Ella separa y desata... Ella fija.',
      textAlign: TextAlign.justify,));
  }
}