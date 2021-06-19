import 'dart:async';
import 'package:apphackagrosebraeba/utils/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apphackagrosebraeba/utils/UsuarioFirebase.dart';

class TransacaoGrid extends StatelessWidget {
  final String tipoUsuario;
  const TransacaoGrid(this.tipoUsuario);

  @override
  Widget build(BuildContext context) {

    final _controller = StreamController<QuerySnapshot>.broadcast();
    Firestore db = Firestore.instance;

    _recuperaIdUsuariologado() async {
      // Usuario usuario = await UsuarioFirebase.getDadosUsuarioLogado();
      FirebaseUser firebaseUser = await UsuarioFirebase.getUsuarioAtual();
      return firebaseUser.uid;
    }

    Future<Stream<QuerySnapshot>> _adicionarListener() async {
      final idUsuario = await _recuperaIdUsuariologado();
      print("idUsuario:");
      print(idUsuario);

      final stream = db.collection("transacao")
          // .where("idUsuario", isEqualTo: idUsuario)
          .orderBy("tipo")
          .snapshots();

      stream.listen((dados){
        _controller.add( dados );
      });
    }

    _adicionarListener();

    var mensagemNaoTemDados = Center(
      child: Text(
        "Não existe transacao cadastrados! :(",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );

    Future<DocumentSnapshot> _recuperarProduto(idProduto) async {
      Firestore db = Firestore.instance;
      DocumentSnapshot documentSnapshot = await db
          .collection("produtos")
          .document( idProduto )
          .get();

      return documentSnapshot;
    }

    return StreamBuilder<QuerySnapshot> (
      stream: _controller.stream,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        
        QuerySnapshot querySnapshot = snapshot.data;

        if( querySnapshot.documents.length == 0 ){
          return mensagemNaoTemDados;
        } else {
          return GridView.builder(
            itemCount: querySnapshot.documents.length,
            itemBuilder: (ctx, i) {

            List<DocumentSnapshot> transacao = querySnapshot.documents.toList();
            DocumentSnapshot item = transacao[i];

            String id = '0';
            String idUsuario = item["idUsuario"];
            String status = item["status"];
            String tipo = item["tipo"];
            double preco = item["preco"];
            // String entrega = item["entrega"].toString();
            int quantidade = item["quantidade"];
            String local = item["local"];

            String _idProduto = item["idProduto"];
            print("idProduto:");
            print(_idProduto);
            
            String imageUrl = item["imageUrl"];
            String title = item["title"];
            bool isFavorite = item["isFavorite"];

            /*
            // DocumentSnapshot produtoSnapshot;
            _recuperarProduto(_idProduto).then((produtoSnapshot) async {

              print("recupera produtoSnapshot");

              imageUrl = produtoSnapshot.data["imageUrl"];
              title = produtoSnapshot.data["title"];
              isFavorite = produtoSnapshot.data["isFavorite"];

              print("dentro recupera " + DateTime.now().toString());
              print(imageUrl);
              print(title);
              print(isFavorite);
              print(tipo);

            });
            */
            
            return buildClipRRect(context, item, id, imageUrl, tipo, isFavorite, title);
            
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          );
        }
      },
    );
  
  }

  ClipRRect buildClipRRect(BuildContext context, DocumentSnapshot item, String id, String imageUrl, String tipo, bool isFavorite, String title)  {
    // print("dentro " + DateTime.now().toString());
    // print(imageUrl);
    // print(title);
    // print(isFavorite);
    // print(tipo);

    return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.PRODUCT_DETAIL,
                      arguments: item, //product
                    );
                  },
                  child: Hero(
                    tag: id,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/product-placeholder.jpg'),
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: tipo == 'Demanda' ? Colors.black87 : Colors.green,
                  leading: IconButton(
                      icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        // marca como favorito
                        // product.toggleFavorite(auth.token, auth.userId);
                      },
                    ),
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
  }
}
