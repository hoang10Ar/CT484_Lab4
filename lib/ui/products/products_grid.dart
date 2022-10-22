import 'package:flutter/cupertino.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/ui/products/product_grid_tile.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.showFavorites, {Key? key}) : super(key: key);

  final bool showFavorites;

  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => showFavorites
            ? productsManager.favoriteItems
            : productsManager.items);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductGridTile(products[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
