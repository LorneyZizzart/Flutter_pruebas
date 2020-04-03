import 'package:flutter/material.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: (){},
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Procuto'
      ),
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
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else{
          return 'Debe ser números';
        }
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
      onPressed: _submit,
    );
  }

  void _submit(){
    if(!formKey.currentState.validate()) return;
    print('Todo Ok');
    if(formKey.currentState.validate()){
      //cuando el formulario es valido
    }
  }
}