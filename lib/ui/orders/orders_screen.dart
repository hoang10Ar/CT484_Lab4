import 'package:flutter/material.dart';
import 'package:myshop/ui/orders/order_item_card.dart';
import 'package:myshop/ui/orders/orders_manager.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building orders");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      drawer: const AppDrawer(),
      body: Consumer<OrdersManager>(
        builder: (context, ordersManager, child) {
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (context, index) =>
                OrderItemCard(ordersManager.orders[index]),
          );
        },
      ),
    );
  }
}
