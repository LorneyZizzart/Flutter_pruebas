import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/models/layout_model.dart';
import 'package:header_cuadrado/src/pages/launchr_page.dart';
import 'package:header_cuadrado/src/pages/launchr_table_page.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new LayoutModel(),
    child: ChangeNotifierProvider(
      create: (_) => ThemeChanger(2),
      child: MyApp(), 
    ),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Material App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientacion $orientation');
          final screenSize = MediaQuery.of(context).size;

          if(screenSize.width > 500){
            return LauncherTabletPage();
          }else{
            return LauncherPage();
          }
          // return Container(child: LauncherPage(),);
        },

      )
      // home: AnimacionesPage()
    );
  }
}