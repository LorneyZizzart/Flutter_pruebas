import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/peliculas.model.dart';

class PelicularProvider{
  String _apikey = '80d905e50c2191fbcf448cb6c942e786';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async{

    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language
    });
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPeliculasPopulares() async{

    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language': _language
    });

    return await _procesarRespuesta(url);
  }
}