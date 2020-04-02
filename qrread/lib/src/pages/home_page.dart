import 'dart:io';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:qrread/src/utils/utils.dart' as utils;
import 'package:qrread/src/pages/direcciones_page.dart';
import 'package:qrread/src/pages/mapas_page.dart';
import 'package:qrread/src/bloc/scan_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scaner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => scansBloc.borrarScans(),
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBotonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: ()=>_scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(BuildContext context)async{
    // https://www.google.com/
    // geo:40.7481662272785,-74.11305799921878
    String futureString ='https://www.google.com/';
    //START PARA ESCANEAR EL QR
    // try {
    //   futureString = await BarcodeScanner.scan();
    // } catch (e) {
    //   futureString = e.toString();
    // }
    // print('Future string: $futureString');
    // if(futureString != null){
    //   print('Tenemos informacion');
    // }
    //START PARA ESCANEAR EL QR

    if(futureString != null){
      final scan = ScanModel(valor:futureString);
      // DBProvider.db.nuevoScan(scan); 
      scansBloc.agregarScan(scan);     

      // final scan2 = ScanModel(valor:'geo:40.7481662272785,-74.11305799921878');
      // scansBloc.agregarScan(scan2);  
      if(Platform.isIOS){ //para saber el SO del dispositivo
        Future.delayed(Duration(microseconds: 750),(){
          utils.abrirScan(context, scan);
        });
      }else{
        utils.abrirScan(context, scan);
      }

    }
  }

  Widget _callPage(int paginaActual){
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return  DireccionesPage();
        break;
      default:
        return MapasPage();
    }
  }

  Widget _crearBotonNavigationBar(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        )
      ],
    );
  }
}