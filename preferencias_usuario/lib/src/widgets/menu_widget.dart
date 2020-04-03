import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/header.jpg'),
                  fit: BoxFit.cover // cubre todo el ancho
                ),                
              ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue,),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue,),
            title: Text('Party'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue,),
            title: Text('People'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue,),
            title: Text('Setting'),
            onTap: () {
              // Navigator.pop(context); //solo en envia a la pagina y cierra el menu
              // Navigator.pushNamed(context, SettingsPage.routeName); //esto muestra la opcion de la flecha para volver atras
              Navigator.pushReplacementNamed(context, SettingsPage.routeName); // este bloquea la opcion de volver atrar
              }
          )
        ],
      ),
    );
  }
}