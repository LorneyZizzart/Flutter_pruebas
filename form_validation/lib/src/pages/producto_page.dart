import 'package:flutter/material.dart';
import 'package:form_validation/src/model/producto_model.dart';
import 'package:form_validation/src/provider/producto_provider.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final productoProvider = new ProductoProvider();

  ProductoModel productoModel = new ProductoModel();
  bool _guardando = false;
  @override
  Widget build(BuildContext context) {

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

  void _submit(){
    if(!formKey.currentState.validate()) return;
      //cuando el formulario es valido
      formKey.currentState.save();
      
      setState(() {_guardando = true;});
      if(productoModel.id == null){
        productoProvider.crearProducto(productoModel);  
      }else{
        productoProvider.editarProducto(productoModel);
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

  _seleccionarFoto(){

  }

  _tomarFoto(){
    
  }
}