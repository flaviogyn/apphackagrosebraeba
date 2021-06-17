import 'dart:async';
import 'package:apphackagrosebraeba/utils/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransacaoGrid extends StatelessWidget {
  final String tipoUsuario;
  const TransacaoGrid(this.tipoUsuario);

  @override
  Widget build(BuildContext context) {

    final _controller = StreamController<QuerySnapshot>.broadcast();
    Firestore db = Firestore.instance;

    Stream<QuerySnapshot> _adicionarListenerRequisicoes(){
      final stream = db.collection("transacao")
          .where("tipoUsuario", isEqualTo: tipoUsuario)
          .orderBy("entrega")
          .snapshots();

      stream.listen((dados){
        print(dados);
        _controller.add( dados );
      });
    }

    _adicionarListenerRequisicoes();

    var mensagemNaoTemDados = Center(
      child: Text(
        "Não existe transacao cadastrados! :(",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );

    _recuperarProduto(idProduto) async {
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

            String _id = '0';
            String _idUsuario = item["idUsuario"];;
            String _status = item["status"];
            String _tipo = item["tipo"];
            double _preco = item["preco"];
            DateTime _entrega = item["entrega"];
            int _quantidade = item["quantidade"];
            String local = item["local"];

            String _idProduto = item["idProduto"];
            final produtoSnapshot = _recuperarProduto(_idProduto);

            String imageUrl = produtoSnapshot.imageUrl;
            String title = item["title"];
            bool isFavorite = item["isFavorite"];

            String id = '10'; // item["id"];

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
                        placeholder: AssetImage('assets/images/product-placeholder.png'),
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  footer: GridTileBar(
                    backgroundColor: tipoUsuario == 'produtor' ? Colors.black87 : Colors.green,
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
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ));
        }
      },
    );
  
  }
}
