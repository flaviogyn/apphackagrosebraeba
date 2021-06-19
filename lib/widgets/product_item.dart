import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  // final Produto product;
  final DocumentSnapshot product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product["imageUrl"],
        ),
      ),
      title: Text(product["title"] + "\n Preço Médio: " + product["price"].toString()),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Excluir Produto'),
                    content: Text('Tem Certeza?'),
                    actions: [
                      FlatButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        icon: Icon(Icons.exit_to_app),
                        label: Text('Não'),
                      ),
                      FlatButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        icon: Icon(Icons.save),
                        label: Text('Sim'),
                      ),
                    ],
                  ),
                ).then((value) async {
                  if (value) {
                    // TODO: BUSCA PRODUTOS
                    // try {
                    //   await Provider.of<Products>(context, listen: false)
                    //       .deleteProduct(product.id);
                    // } on HttpException catch (error) {
                    //   print(error.toString());
                    //   scaffold.showSnackBar(
                    //     SnackBar(
                    //       content: Text(error.toString()),
                    //     ),
                    //   );
                    // }

                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
