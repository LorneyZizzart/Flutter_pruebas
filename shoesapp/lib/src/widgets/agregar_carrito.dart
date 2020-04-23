import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widget.dart';

class AgregarCarritoBoton extends StatelessWidget {

  final double monto;
  const AgregarCarritoBoton({Key key, this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: <Widget>[
            Text('\$$monto', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),),
            Spacer(),
            BottonNaranja(texto: 'Add to cart',),
            SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}