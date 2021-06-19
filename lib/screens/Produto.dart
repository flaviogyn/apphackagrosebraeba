import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_item.dart';
import '../utils/app_routes.dart';

class ProdutoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final _controller = StreamController<QuerySnapshot>.broadcast();
  Firestore db = Firestore.instance;

  Stream<QuerySnapshot> _adicionarListener(){
    final stream = db.collection("produtos")
        .orderBy("categoria")
        .snapshots();

    stream.listen((dados){
      _controller.add( dados );
    });
  }

  _adicionarListener();

  const mensagemNaoTemDados = Center(
    child: Text(
      "Não existe transacao cadastrados! :(",
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
    ),
  );

  return Scaffold(
    appBar: AppBar(
      title: Text('Lista Produtos'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
          },
        )
      ],
    ),
    drawer: AppDrawer(),
    body: Padding(
      padding: EdgeInsets.all(8),
      child: StreamBuilder<QuerySnapshot>(
        stream: _controller.stream,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          QuerySnapshot querySnapshot = snapshot.data;

          if( querySnapshot.documents.length == 0 ){
            return mensagemNaoTemDados;
          } else {
            return ListView.builder(
              itemCount: querySnapshot.documents.length,
              itemBuilder: (ctx, i) { 
                List<DocumentSnapshot> productsData = querySnapshot.documents.toList();
                DocumentSnapshot products = productsData[i];

                return Column(
                  children: [
                    ProductItem(products),
                    Divider(),
                  ],
                );
              },
            );
          }
        }
      ),
    ),
  );
  }
}
