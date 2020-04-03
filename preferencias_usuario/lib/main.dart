import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/share_pref/preferencias_usuarios.dart';
 
void main() async{ 
   WidgetsFlutterBinding.ensureInitialized(); // para inicializar cualquier funcion en el main
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());

  }
 
class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario(); // sigletton
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina, // para inicializar la ultima pagina
      routes: {
        HomePage.routeName : (BuildContext context)  => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage()
      },
    );
  }
}