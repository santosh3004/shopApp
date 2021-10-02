import 'package:flutter/material.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/screen/cart_screen.dart';
import 'package:shopApp/widgets/drawer.dart';
import '../widgets/product_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop is Easy in Hand'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only favorites'),
                        value: FilterOptions.Favorite),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOptions.All)
                  ]),
          Consumer<Cart>(
            builder: (_, cartData, ch) =>
                Badge(child: ch, value: cartData.itemCount.toString()),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }),
          )
        ],
      ),
      drawer: DrawerApp(),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
