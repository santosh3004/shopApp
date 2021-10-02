import 'package:flutter/material.dart';
import 'package:shopApp/widgets/drawer.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/user_product.dart';

class UserProduct extends StatelessWidget {
  static const routeName = 'userProductScreen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      drawer: DrawerApp(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => UserProductW(
              productsData.items[i].imageUrl, productsData.items[i].title),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
