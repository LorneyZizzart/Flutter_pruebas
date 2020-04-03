import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_pref/preferencias_usuarios.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();


  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName; // para inicializar la ultima pagina
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('Color secundario: ${prefs.colorSecundario}'),
        Divider(),
        Text('Género: ${prefs.genero}'),
        Divider(),
        Text('Nombre de usuario: ${prefs.nombre}'),
        Divider()
      ],),
    );
  }

  // Drawer _crearMenu(BuildContext context){
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: <Widget>[
  //         DrawerHeader(
  //           child: Container(),
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: AssetImage('assets/header.jpg'),
  //                 fit: BoxFit.cover // cubre todo el ancho
  //               ),                
  //             ),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.pages, color: Colors.blue,),
  //           title: Text('Home'),
  //           onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.party_mode, color: Colors.blue,),
  //           title: Text('Party'),
  //           onTap: (){},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.people, color: Colors.blue,),
  //           title: Text('People'),
  //           onTap: (){},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.settings, color: Colors.blue,),
  //           title: Text('Setting'),
  //           onTap: () {
  //             // Navigator.pop(context); //solo en envia a la pagina y cierra el menu
  //             // Navigator.pushNamed(context, SettingsPage.routeName); //esto muestra la opcion de la flecha para volver atras
  //             Navigator.pushReplacementNamed(context, SettingsPage.routeName); // este bloquea la opcion de volver atrar
  //             }
  //         )
  //       ],
  //     ),
  //   );
  // }
}