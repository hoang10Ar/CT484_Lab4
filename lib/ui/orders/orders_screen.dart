import 'package:flutter/material.dart';
import 'package:myshop/ui/orders/order_item_card.dart';
import 'package:myshop/ui/orders/orders_manager.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("building orders");
    final ordersManager = OrdersManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: ListView.builder(
        itemCount: ordersManager.orderCount,
        itemBuilder: (context, index) => OrderItemCard(
          ordersManager.orders[index],
        ),
      ),
    );
  }
}
