import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/model/producto_model.dart';
import 'package:form_validation/src/provider/producto_provider.dart';

class HomePage extends StatelessWidget {
  
  final productoProvider = new ProductoProvider();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
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
      body: _crearListado(context),
      floatingActionButton: _crearBotton(context),
    );
  }

  Widget _crearListado(BuildContext context){
    return FutureBuilder(
      future: productoProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i]),
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion){
        productoProvider.borrarProducto(producto.id);
      },
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
      ),
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