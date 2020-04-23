import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:header_cuadrado/src/routes/routes.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños de flutter telefono'),
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones()
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.currentTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.currentTheme.accentColor,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon (Icons.chevron_right, color: appTheme.currentTheme.accentColor,),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: (appTheme.darkTheme) ? accentColor : Colors.pink,
                  child: Text('JS', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(value: appTheme.darkTheme, activeColor: accentColor, 
              onChanged: (value){
                appTheme.darkTheme = value;
              }),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor,),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(value: appTheme.customTheme, activeColor: accentColor, 
                onChanged: (value){
                  appTheme.customTheme = value;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}