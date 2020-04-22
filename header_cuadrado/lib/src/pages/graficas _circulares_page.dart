import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:header_cuadrado/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Circular progress'),),
      body: Center(
        // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
                CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.pink,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.red,),
                CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.orange,),
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    @required this.porcentaje, @required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario:  this.color,
        colorSecundario: appTheme.currentTheme.accentColor,           
        grosorPrimario: 10.0,
        grosorSecundario: 4.0,
      ),
    );
  }
}