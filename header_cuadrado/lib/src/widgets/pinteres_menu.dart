import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({this.mostrar = true, this.backgroundColor = Colors.black38, this.activeColor = Colors.black, this.inactiveColor = Colors.blueGrey, @required this.items});

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie chart');}),
  //   PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
  //   PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon notifications');}),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle, onPressed');}),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(builder: (BuildContext context) {
          Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
          return _PinterestMenuBackground(
            child: _MenuItems(items),);
        },
           
        ),
      ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;

  const _PinterestMenuBackground({
    Key key, @required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),        
    );
  }
}

class _MenuItems  extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon, 
          size: (menuModel.itemSeleccionado == index) ? 30 : 25, 
          color: (menuModel.itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor (Color backgroundColor){
    this._backgroundColor = backgroundColor;
  }

  Color get activeColor => this._activeColor;
  set activeColor (Color activeColor){
    this._activeColor = activeColor;
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor (Color inactiveColor){
    this._inactiveColor = inactiveColor;
  }
}