import 'package:apphackagrosebraeba/widgets/transacao_grid.dart';
import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';
import '../utils/app_routes.dart';

enum FilterOptions {
  Favorite,
  All,
}

class PainelScreen extends StatefulWidget {
  final String tipoUsuario;
  PainelScreen(this.tipoUsuario);

  @override
  _PainelScreenState createState() => _PainelScreenState(tipoUsuario);
}

class _PainelScreenState extends State<PainelScreen> {
  final String tipoUsuario;
  _PainelScreenState(this.tipoUsuario);

  bool _showFavoriteOnly = false;
  bool _isLoading = true;
  int _countCart = 0;

  @override
  void initState() {
    super.initState();
      setState(() {
        _isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Painel Ofertas/Demandas'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                  // products.showFavoriteOnly();
                } else {
                  _showFavoriteOnly = false;
                  // products.showAll();
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Ofertas'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Badge(
              value: _countCart.toString(),
              child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
            ),
          ),
          // Consumer<Cart>(
          //   child: IconButton(
          //     icon: Icon(Icons.shopping_cart),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(AppRoutes.CART);
          //     },
          //   ),
          //   builder: (_, cart, child) => Badge(
          //     value: cart.intemsCount.toString(),
          //     child: child,
          //   ),
          // )
        ],
      ),
      // body: _isLoading ? Center(
      //   child: CircularProgressIndicator(),
      // ) : ProductGrid(_showFavoriteOnly),
      body: TransacaoGrid(tipoUsuario),
      drawer: AppDrawer(),
    );
  }
}
