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
  @override
  _PainelScreenState createState() => _PainelScreenState();
}

class _PainelScreenState extends State<PainelScreen> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Provider.of<Products>(context, listen: false).loadProducts().then((_) {
      setState(() {
        _isLoading = false;
      });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final Products products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Controle'),
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
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
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
      body: ProductGrid(_showFavoriteOnly),
      drawer: AppDrawer(),
    );
  }
}
