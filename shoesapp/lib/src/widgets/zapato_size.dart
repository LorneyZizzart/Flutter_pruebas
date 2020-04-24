import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ZapatoSizePreview({Key key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!this.fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 30, 
          vertical: (this.fullScreen) ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 400 : 430,
          decoration: BoxDecoration(
            color: Color(0xffF8D468),
            borderRadius: (!this.fullScreen) ? BorderRadius.circular(50) : 
            BorderRadius.only(
              bottomLeft: Radius.circular(50), 
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )
          ),
          child: Column(
            children: <Widget>[
              _ZapatoConSombra(),
              if(!this.fullScreen)
              _ZapatosTallas()
            ],          
          ),
        ),
      ),
    );
  }
}

class _ZapatosTallas extends StatelessWidget {
  const _ZapatosTallas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatoCaja(numero: 7,),
          _TallaZapatoCaja(numero: 7.5,),
          _TallaZapatoCaja(numero: 8,),
          _TallaZapatoCaja(numero: 8.5,),
          _TallaZapatoCaja(numero: 9,),
          _TallaZapatoCaja(numero: 9.5,)
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {

  final double numero;

  const _TallaZapatoCaja({
    Key key, this.numero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final zapatModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: (){
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0', '')}', style: TextStyle(
          // color: Colors.yellow.withOpacity(1),
          color: (this.numero == zapatModel.talla) ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (this.numero == zapatModel.talla) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numero == zapatModel.talla)
            BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0, 5))
          ]
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(children: <Widget>[
        Positioned(
          bottom: 10,
          right: 0,  
          child: _ZapatoSombra()
        ),
        Image(image: AssetImage(zapatoModel.assetsImage))
      ],),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}