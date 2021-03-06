import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';
import 'package:form_validation/src/pages/producto_page.dart';
import 'package:form_validation/src/pages/registro_page.dart';
import 'package:form_validation/src/preferencias/preferencias_usuario.dart';
 
void main()async{ 
  WidgetsFlutterBinding.ensureInitialized(); // para inicializar cualquier funcion en el main
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
  }
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',      
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'home' : (BuildContext context) => HomePage(),
        'producto' : (BuildContext context) => ProductoPage(),
        'registro' : (BuildContext context) => RegistroPage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
      
    );
  }
}