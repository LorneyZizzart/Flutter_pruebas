import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;  
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({Key key, @required this.slides, this.puntosArriba = false, this.colorPrimario = Colors.blue, this.colorSecundario = Colors.grey, this.bulletPrimario = 12, this.bulletSecundario = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
                Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;

                Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
                Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;

                return Column(
                  children: <Widget>[
                    if(this.puntosArriba) _Dots(totalSlides: this.slides.length,),
                    Expanded(
                      child: _Slides(slides: this.slides,)
                    ),
                    if(!this.puntosArriba) _Dots(totalSlides: this.slides.length,),
                  ],
                );
              },

            )
          ),
      ),
    );
  }
}
class _Dots extends StatelessWidget {

  final int totalSlides;
  const _Dots({Key key, @required this.totalSlides}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (i) =>  _Dot(index: i) ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({Key key, this.index});

  @override
  Widget build(BuildContext context) {
    //pagina actual que se ve
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final slideShowModel = Provider.of<_SlideshowModel>(context);
    double tamano;
    Color color;

    if(slideShowModel.currentPage >= index - 0.5 && slideShowModel.currentPage < index + 0.5){
      tamano =  slideShowModel.bulletPrimario;
      color = slideShowModel.colorPrimario;
    }else{
      tamano =  slideShowModel.bulletSecundario;
      color = slideShowModel.colorSecundario;
    }

    

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides({Key key, this.slides}) : super(key: key);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener((){
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =  pageViewController.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide('assets/svg/1.svg'),
        //   _Slide('assets/svg/2.svg'),
        //   _Slide('assets/svg/3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  
  _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(5),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario =Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage (double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario (Color colorPrimario){
    this._colorPrimario = colorPrimario;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario (Color colorSecundario){
    this._colorSecundario = colorSecundario;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario (double bulletPrimario){
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario (double bulletSecundario){
    this._bulletSecundario = bulletSecundario;
  }



}