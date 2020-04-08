import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/model/producto_model.dart';
import 'package:form_validation/src/provider/producto_provider.dart';

class HomePage extends StatelessWidget {
  
  // final productoProvider = new ProductoProvider();
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      // body: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('Email: ${bloc.email}'),
      //       Divider(),
      //       Text('Password: ${bloc.password}'),
      //     ],
      // ),
      body: _crearListado(context, productosBloc),
      floatingActionButton: _crearBotton(context),
    );
  }

  Widget _crearListado(BuildContext context, ProductosBloc productosBloc){

    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
                if(snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productosBloc, productos[i]),
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    //SIN BLOC
    // return FutureBuilder(
    //   future: productosBloc.cargarProductos(),
    //   builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
    //     if(snapshot.hasData){
    //       final productos = snapshot.data;
    //       return ListView.builder(
    //         itemCount: productos.length,
    //         itemBuilder: (context, i) => _crearItem(context, productos[i]),
    //       );
    //     }else{
    //       return Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc, ProductoModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion){
        // productoProvider.borrarProducto(producto.id);
        productosBloc.borrarProducto(producto.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            (producto.fotoUrl == null) 
            ? Image(image: AssetImage('assets/no-image.png')) 
            : FadeInImage(
              image: NetworkImage(producto.fotoUrl),
              placeholder: AssetImage('assets/loading.gif'),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text(producto.id),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
            )
          ],
        ),
      ),
      // child: ListTile(
      //   title: Text('${producto.titulo} - ${producto.valor}'),
      //   subtitle: Text(producto.id),
      //   onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
      // ),
    );
  }


  Widget _crearBotton(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}