import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
import 'package:form_validation/src/bloc/producto_bloc.dart';
export 'package:form_validation/src/bloc/producto_bloc.dart';
export 'package:form_validation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget{
  // InheritedWidget ayuda a localizar desde cualquier lugar
  static Provider _provider;
  final loginBloc = LoginBloc();
// son los mismo sin o con el new
  final _productosBloc = new ProductosBloc();

  factory Provider({Key key, Widget child}){
    if(_provider == null){
      _provider = new Provider._internal(key: key, child: child);
    }
    return _provider;
  }

  Provider._internal({Key key, Widget child}) : super(key:key, child:child);
  
  

  // Provider({Key key, Widget child}) : super(key:key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc  of (BuildContext context){ //busca en el context
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc; // y esto lo extrae
  }

  static ProductosBloc productosBloc (BuildContext context){ //busca en el context
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)._productosBloc; // buscar en el arbol de providers y extrae llamando provider una opcion que se llame _productosBloc
  }
  
}