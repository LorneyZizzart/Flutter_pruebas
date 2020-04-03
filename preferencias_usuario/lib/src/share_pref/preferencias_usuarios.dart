import 'package:shared_preferences/shared_preferences.dart';
class PreferenciasUsuario {
  
  static final PreferenciasUsuario _preferenciasUsuario = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){ // Constructor
    return _preferenciasUsuario;
  }

  PreferenciasUsuario._internal(); //siempre

  SharedPreferences _prefs;

  initPrefs()async{ //Inicializamos
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // GET AND SET

  get genero{
    return _prefs.get('genero') ?? 1;
  }

  set genero (int value){
    _prefs.setInt('genero', value);
  }

  get colorSecundario{
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario (bool value){
    _prefs.setBool('colorSecundario', value);
  }

  get nombre{
    return _prefs.getString('nombre') ?? '';
  }

  set nombre (String value){
    _prefs.setString('nombre', value);
  }

  // SET GET DE LA ULTIMA PAGINA
  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina (String value){
    _prefs.setString('ultimaPagina', value);
  }

}