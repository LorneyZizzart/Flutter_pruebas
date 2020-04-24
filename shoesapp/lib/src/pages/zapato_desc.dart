import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widget.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Hero(tag: 'zapato-1',child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
              top: 30,
              child: FloatingActionButton(
                child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                onPressed: (){
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0,
              ),
            )
          ],),
          Expanded(child: SingleChildScrollView(child: Column(children: <Widget>[
            ZapatoDescripcion(
          titulo: 'Nike Air Max 720',
          descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
          ),
          _MontoBuyNow(),
          _ColorYmas(),
          _BotonesLikeCart()
          ],),),)
        ],
      )
    );
  }
}

class _BotonesLikeCart extends StatelessWidget {
  const _BotonesLikeCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        _BottonSombreado(icon: Icon(Icons.star, color: Colors.red, size: 25,),),
        _BottonSombreado(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,),),
        _BottonSombreado(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,),)
      ],),
    );
  }
}

class _BottonSombreado extends StatelessWidget {

  final Icon icon;

  const _BottonSombreado({
    Key key, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      height: 55, 
      width: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
    );
  }
}

class _ColorYmas extends StatelessWidget {

  const _ColorYmas({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(children: <Widget>[
              Positioned(left: 90, child: _BotonColor(color: Color(0xffC6D642), index :4, urlImg: 'assets/verde.png')),
              Positioned(left: 60, child: _BotonColor(color: Color(0xffFFAD29), index :3, urlImg: 'assets/amarillo.png')),
              Positioned(left: 30, child: _BotonColor(color: Color(0xff2099F1), index :2, urlImg: 'assets/azul.png')),
              _BotonColor(color: Color(0xff364D56), index :1, urlImg: 'assets/negro.png'),
            ],),
          ),
          // Spacer(),
          BottonNaranja(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xFFFFC675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final int index;
  final String urlImg;
  const _BotonColor({
    Key key,
    @required this.color, this.index, this.urlImg = 'assets/azul.png',
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: this.index * 400),
      delay: Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: (){
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetsImage = this.urlImg;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top:20, bottom: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold) ,),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BottonNaranja(texto: 'Buy now', ancho: 120, alto: 40,)
            )
          ],
        ),
      ),
    );
  }
}