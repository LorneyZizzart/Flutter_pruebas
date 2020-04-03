import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_pref/preferencias_usuarios.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre = 'Pedro';

  TextEditingController _textEditingController;
  final prefs = new PreferenciasUsuario(); // ya no es necesario el setState con este metodo

  @override
  void initState(){  // para iniciar con datos predeterminados
    // TODO: implement initState
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textEditingController =  new TextEditingController(text: prefs.nombre);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body:ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value){
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono'
              ),
              onChanged: (value){
                prefs.nombre = value;
              },
            ),
            
          )
        ],
      ),
    );
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor; 
    _genero = valor;
    setState(() {});
  }
}