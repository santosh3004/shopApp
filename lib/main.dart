import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/providers/orders.dart';
import 'package:shopApp/screen/cart_screen.dart';
import './screen/products_overview_screen.dart';
import './screen/product_detail_screen.dart';
import './providers/products_provider.dart';
import './screen/orders_screen.dart';
import './screen/userproduct.dart';
import './screen/newProduct.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx2) => CartScreen(),
          OrdersScreen.routeName: (ctx3) => OrdersScreen(),
          UserProduct.routeName: (ctx4) => UserProduct(),
          NewProduct.routeName: (ctx5) => NewProduct()
        },
      ),
    );
  }
}
