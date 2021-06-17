import 'package:apphackagrosebraeba/screens/Cadastro.dart';
import 'package:apphackagrosebraeba/screens/Home.dart';
import 'package:apphackagrosebraeba/screens/Painel.dart';
import 'package:apphackagrosebraeba/utils/app_routes.dart';
import 'package:apphackagrosebraeba/utils/custom_route.dart';
import 'package:flutter/material.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xff37474f),
  accentColor: Color(0xff546e7a),
  fontFamily: 'Lato',
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomPageTransitionsBuilder(),
      TargetPlatform.iOS: CustomPageTransitionsBuilder(),
    }
  )
);

void main() => runApp(MaterialApp(
  title: "Hack Agro FarmPlus",
  home: Home(),
  theme: temaPadrao,
  debugShowCheckedModeBanner: false,
  routes: {
    AppRoutes.HOME: (ctx) => Home(),
    AppRoutes.CADASTRO: (ctx) => Cadastro(),
    AppRoutes.PAINEL: (ctx) => PainelScreen('produtor'),
    // AppRoutes.CART: (ctx) => CartScreeen(),
    // AppRoutes.ORDERS: (ctx) => OrdersScreen(),
    // AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
    // AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreeen(),
  },

));

