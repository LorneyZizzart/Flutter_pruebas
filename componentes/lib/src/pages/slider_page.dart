import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top :50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded( //para que no se salga de los margenes
              child: _crearImagen()
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
        
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/1/19/Batman_%28circa_2016%29.png'),
      width: _valorSlider,
      fit: BoxFit.contain, //para que no se salga de los margenes
    );
  }

  Widget _crearCheckBox() {

    return CheckboxListTile(
      value: _bloquearCheck,
      onChanged: (value){
        setState(() {
          _bloquearCheck = value;
        });
      },
      title: Text('Bloquear slider'),
    );

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (value){
    //     setState(() {
    //       _bloquearCheck = value;
    //     });
    //   },
    // );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      value: _bloquearCheck,
      onChanged: (value){
        setState(() {
          _bloquearCheck = value;
        });
      },
      title: Text('Bloquear slider'),
    );
  }
}