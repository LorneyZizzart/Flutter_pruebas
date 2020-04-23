import 'package:flutter/material.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: Color(0xffF8D468),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: <Widget>[
            _ZapatoConSombra(),
            _ZapatosTallas()
          ],          
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
    return Container(
      alignment: Alignment.center,
      child: Text('${numero.toString().replaceAll('.0', '')}', style: TextStyle(
        // color: Colors.yellow.withOpacity(1),
        color: (this.numero == 9) ? Colors.white : Color(0xffF1A23A),
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: (this.numero == 9) ? Color(0xffF1A23A) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(this.numero == 9)
          BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0, 5))
        ]
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(children: <Widget>[
        Positioned(
          bottom: 10,
          right: 0,  
          child: _ZapatoSombra()
        ),
        Image(image: AssetImage('assets/azul.png'))
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