import 'package:flutter/material.dart';
import 'package:header_cuadrado/src/theme/theme.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        _MainScroll(),
        Positioned(bottom: 0, right: 0, child: _ButtonBottonNewList())
      ],),
      // body: _HeaderPage()
      // body: _Lista()

    );
  }
}

class _ButtonBottonNewList extends StatelessWidget {
  const _ButtonBottonNewList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: (){},
        color: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor :  Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Text('CREATE NEW LIST', style: TextStyle(color: appTheme.currentTheme.scaffoldBackgroundColor, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(titulo: 'Orange', color : Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color:Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscription', color:Color(0xffF2A45A)),
    _ListItem(titulo: 'Orange', color : Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color:Color(0xffF7738A) ),
    _ListItem(titulo: 'Subscription', color:Color(0xffF2A45A)),
    _ListItem(titulo: 'Orange', color : Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color:Color(0xffF7738A) ),
    _ListItem(titulo: 'Subscription', color:Color(0xffF2A45A)),
    ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   // elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('data'),
        // ),
        SliverPersistentHeader(
          floating: true, // para que se muestre en cuanto se suba el scroll
          delegate: _SliverCustomHeaderDelegate(250, 200, 
          Container( 
            alignment: Alignment.centerLeft, // centrar a la derecha
            color:appTheme.scaffoldBackgroundColor, 
            child: _HeaderPage()
            )
          ) ,
        ),
        SliverList(
          delegate: SliverChildListDelegate([...items, SizedBox(height: 100,)]), // deja un espacio abajo de 100
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double _maxExtent;
  final double _minExtent;
  final Widget _child;

  _SliverCustomHeaderDelegate(this._maxExtent, this._minExtent, this._child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: _child,);
  }

  @override
  double get maxExtent => _maxExtent;
  // double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return _maxExtent != oldDelegate.maxExtent || 
           _minExtent != oldDelegate.minExtent ;
  }

    
}

class _HeaderPage extends StatelessWidget {
  const _HeaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text('New', 
          style: TextStyle(            
            color: (appTheme.darkTheme) ? appTheme.currentTheme.backgroundColor : Colors.deepPurple, 
            fontSize: 50, fontWeight: 
            FontWeight.bold),),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? appTheme.currentTheme.backgroundColor : Colors.red.withOpacity(0.2),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(fontSize: 50, 
              fontWeight: FontWeight.bold, 
              color: Colors.pink
              ),),
            )
          ],
        )
      ],
    );
  }
}

class _Lista extends StatelessWidget {
    final items = [
    _ListItem(titulo: 'Orange', color : Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color:Color(0xffF2A38A) ),
    _ListItem(titulo: 'Subscription', color:Color(0xffF2A45A)),
    _ListItem(titulo: 'Orange', color : Color(0xffF08F66) ),
    _ListItem(titulo: 'Family', color:Color(0xffF7738A) ),
    _ListItem(titulo: 'Subscription', color:Color(0xffF2A45A)),
    ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>items[index],
    );
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  const _ListItem({
    Key key, this.titulo, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      child: Text(titulo, style: TextStyle(
        color: Colors.white, 
        fontWeight: FontWeight.bold, 
        fontSize: 20),),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? appTheme.currentTheme.backgroundColor : color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}