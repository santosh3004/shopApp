import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopApp/widgets/drawer.dart';
import '../providers/orders.dart';
import '../widgets/order_itemW.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'order';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: DrawerApp(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItemW(orders.orders[i]),
        itemCount: orders.orders.length,
      ),
    );
  }
}
