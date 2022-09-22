import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myshop/ui/cart/cart_item_card.dart';
import 'package:myshop/ui/cart/cart_manager.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = CartManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          buildCartSummary(cart, context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: buildCartDetails(cart),
          ),
        ],
      ),
    );
  }

  Widget buildCartSummary(CartManager cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Chip(
            label: Text(
              "\$${cart.totalAmount.toStringAsFixed(2)}",
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.headline6?.color,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          TextButton(
            onPressed: () {
              print("An order has been added");
            },
            style: TextButton.styleFrom(
              textStyle: TextStyle(color: Theme.of(context).primaryColor),
            ),
            child: const Text("ORDER NOW"),
          )
        ],
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView(
      children: cart.productEntries
          .map(
            (entry) => CartItemCard(
              productId: entry.key,
              cardItem: entry.value,
            ),
          )
          .toList(),
    );
  }
}
