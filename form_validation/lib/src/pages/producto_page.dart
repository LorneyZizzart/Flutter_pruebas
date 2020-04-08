import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/producto_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/model/producto_model.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  ProductosBloc productosBloc; 
  ProductoModel productoModel = new ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    productosBloc = Provider.productosBloc(context);
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if(prodData != null){
      productoModel = prodData;
    }
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBotton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(){
    return TextFormField(
      initialValue: productoModel.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => productoModel.titulo = value,
      validator: (value){
        if(value.length < 3){
          return 'Ingrese un nombre valido con mas de 3 caracteres.';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearPrecio(){
    return TextFormField(
      initialValue: productoModel.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => productoModel.valor = double.parse(value),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else{
          return 'Debe ser números';
        }
      },
    );
  }

  Widget _crearDisponible(){
    return SwitchListTile(
      value: productoModel.disponible,
      title: Text('Disponible'),
      activeColor: Theme.of(context).primaryColor,
      onChanged: (value) {
        setState(() {
          productoModel.disponible = value;
        });
      },
    );
  }

  Widget _crearBotton(BuildContext context){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
      
    );
  }

  void _submit()async{
    if(!formKey.currentState.validate()) return;
      //cuando el formulario es valido
      formKey.currentState.save();
      
      setState(() {_guardando = true;});

      if(foto!=null){
        productoModel.fotoUrl = await productosBloc.subirFoto(foto);
      }

      if(productoModel.id == null){
        productosBloc.agregarProducto(productoModel);
        // productoProvider.crearProducto(productoModel);  
      }else{
        // productoProvider.editarProducto(productoModel);
        productosBloc.editarProducto(productoModel);
      }
    setState(() {_guardando = false;});
    mostrarSnackbar('Registro existoso');
    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 2000),
    );

    scaffoldkey.currentState.showSnackBar(snackbar);
  }

  Widget _mostrarFoto(){
    if(productoModel.fotoUrl != null){
      return FadeInImage(
        image: NetworkImage(productoModel.fotoUrl),
        placeholder: AssetImage('assets/loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    }else{
      return Image(
        image: AssetImage(foto?.path ?? 'assets/no-image.png'), // si la fotografia tiene un valor toma el path y si es null muestra el no-image.png
        height: 300.0,
        fit:BoxFit.cover
      );
    }
  }

  _seleccionarFoto()async{
    _procesarImgen(ImageSource.gallery); 
  }

  _tomarFoto()async{
    _procesarImgen(ImageSource.camera);
  }

  _procesarImgen(ImageSource origen)async{
    foto = await ImagePicker.pickImage(
      source: origen
    );

    if(foto != null){
      productoModel.fotoUrl = null;
      
    }

    setState(() {});
  }
}