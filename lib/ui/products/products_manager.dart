import 'package:flutter/cupertino.dart';
import 'package:myshop/models/auth_token.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/services/products_service.dart';

class ProductsManager with ChangeNotifier {
  List<Product> _items = [];

  final ProductService _productService;

  ProductsManager([AuthToken? authToken])
      : _productService = ProductService(authToken);

  set authToken(AuthToken? authToken) {
    _productService.authToken = authToken;
  }

  Future<void> fetchProducts([bool filterByUser = false]) async {
    _items = await _productService.fetchProducts(filterByUser);
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final newProduct = await _productService.addProduct(product);
    if (newProduct != null) {
      _items.add(newProduct);
      notifyListeners();
    }
  }

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}
