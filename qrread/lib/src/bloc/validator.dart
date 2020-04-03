import 'dart:async';

import 'package:qrread/src/bloc/scan_bloc.dart';

class Validators {
  final validarGeo = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers( // scans sink
    handleData: (scans, sink){
      final geoScans = scans.where((s)=>s.tipo == 'geo').toList();
      sink.add(geoScans);
    }
  );

  final validarHttp = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers( // scans sink
    handleData: (scans, sink){
      final geoScans = scans.where((s)=>s.tipo == 'http').toList();
      sink.add(geoScans);
    }
  );
}