import 'package:flutter/material.dart';
import 'package:qrread/src/bloc/scan_bloc.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}