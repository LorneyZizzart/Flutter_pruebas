import 'dart:convert';
import 'dart:io';

import 'package:form_validation/src/preferencias/preferencias_usuario.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/model/producto_model.dart';

class ProductoProvider {
  String _url = 'https://flutter-product-19899.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel producto)async{
    // final url = '$_url/productos.json?auth=${_prefs.token}';
    final url = '$_url/productos.json';
    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    // print(decodedData);
    return true;
  }

  Future<bool> editarProducto(ProductoModel producto)async{
    // final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    final url = '$_url/productos/${producto.id}.json';
    final resp = await http.put(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    // print(decodedData);
    return true;
  }


  Future<List<ProductoModel>> cargarProductos() async{
    // final url = '$_url/productos.json?auth=${_prefs.token}';
    final url = '$_url/productos.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    // print('decodedData');
    // print(decodedData);
    final List<ProductoModel> productos = new List();
    if(decodedData == null) return [];
    if(decodedData['error'] != null) return []; // a partir podemos regresarle al login
    decodedData.forEach((id, prod){
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    // print(productos);
    return productos;
  }

  Future<int> borrarProducto(String id)async{
    // final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);
    print(resp);
    return 1;
  }

  Future<String> subirImagen(File image)async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dngqvyfdj/image/upload?upload_preset=xlyblete');
    final mimeType = mime(image.path).split('/'); // image/jpg
    // tiene un formato el URL
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType(mimeType[0], mimeType[1])
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }
    final resData = json.decode(resp.body);
    print(resData);
    return resData['secure_url'];
  }
}