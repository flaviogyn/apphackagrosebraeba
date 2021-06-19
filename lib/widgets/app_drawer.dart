import 'package:apphackagrosebraeba/screens/Produto.dart';
import 'package:apphackagrosebraeba/utils/contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Bem vindo Usuário!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Ofertas/Demandas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PAINEL, arguments: TIPO_USUARIO);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(builder: (ctx) => OrdersScreen()),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Lista Produtos'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCTS);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () async {
              final FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut().then((value) => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME));
            },
          ),
        ],
      ),
    );
  }
}
