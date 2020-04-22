import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:header_cuadrado/src/widgets/pinteres_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {

  const PinterestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          PinterestGrid(),
          _PinterestMenuLocation(),
        ],),
        // body: PinterestMenu(),
        // body: PinterestGrid(),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mostrar = Provider.of<_MenuModel>(context)._mostrar;
    final appTheme = Provider.of<ThemeChanger>(context);
    return Positioned(
      bottom: 30.0,
      child: Container(
        width: size.width,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar, 
            backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor, 
            activeColor: appTheme.currentTheme.accentColor, 
            // inactiveColor: Colors.pink,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie chart');}),
              PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
              PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon notifications');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle, onPressed');}),            
            ],)
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener((){
      // print('ScrollController ${controller.offset}');
      if(controller.offset > scrollAnterior && controller.offset > 150 ){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      }else{
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index: index,),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;
  const _PinterestItem({
    Key key, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;
  bool get mostrar => this._mostrar;

  set mostrar(bool mostrar){
    this._mostrar = mostrar;
    notifyListeners();
  }
}