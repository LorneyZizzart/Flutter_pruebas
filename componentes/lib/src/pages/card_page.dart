
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color:Colors.blue),
            title: Text('Titulo del card'),
            subtitle: Text('The future must have been obtained earlier, e.g. during State.initState, State.didUpdateConfig, or State.didChangeDependencies. It must not be created during the State.build or StatelessWidget.build method call when constructing the FutureBuilder. If the future is created at the same time as the FutureBuilder, then every time the FutureBuilder'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){

                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){

                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card =  Container(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/original.gif'), 
            image: NetworkImage('https://images.wallpaperscraft.com/image/lake_sunset_horizon_134650_3000x3000.jpg'),
            fadeInDuration: Duration(milliseconds:  200),
            // height: 300.0,
            fit: BoxFit.cover,
            ),
          // Image(
          //   image: NetworkImage('https://images.wallpaperscraft.com/image/lake_sunset_horizon_134650_3000x3000.jpg')
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Descripcion de la imagenes'),
          )
        ],
      ),
    );

    return Container(      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 5.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }
}