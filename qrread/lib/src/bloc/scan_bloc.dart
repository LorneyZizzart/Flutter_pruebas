import 'dart:async';

import 'package:qrread/src/providers/db_provider.dart';
export 'package:qrread/src/providers/db_provider.dart';



class ScansBloc{
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal(){
    //Obtner Scans de la Base de datos
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>>get scansStream => _scansController.stream;

  dispose(){
    _scansController?.close();// si existe (?)
  }

  agregarScan(ScanModel scan)async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  obtenerScans()async{
    _scansController.sink.add(await DBProvider.db.getTodosScans());
  }

  borrarScan(int id)async{
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScans()async{
    await DBProvider.db.deleteAll();
    // _scansController.sink.add([]); //otra opcion
    obtenerScans();
  }

}