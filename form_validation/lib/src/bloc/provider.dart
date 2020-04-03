import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
export 'package:form_validation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  static Provider _provider;

  factory Provider({Key key, Widget child}){
    if(_provider == null){
      _provider = new Provider._internal(key: key, child: child);
    }
    return _provider;
  }

  Provider._internal({Key key, Widget child}) : super(key:key, child:child);
  
  final loginBloc = LoginBloc();

  // Provider({Key key, Widget child}) : super(key:key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc  of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }
  
}