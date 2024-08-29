// lib/models/shopping_cart_model.dart
import 'package:flutter/foundation.dart';
import 'package:pls_work/models/diet_models.dart';
import 'cart_item_model.dart';
import 'package:provider/provider.dart';

class ShoppingCartModel extends ChangeNotifier{
  List<CartItemModel> _items = [];
  List<CartItemModel> get items => _items;

  void addItem(dynamic item) {
    final existingIndex = _items.indexWhere((cartItem) =>
        cartItem.isSameItemAs(item));
    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItemModel(item: item));
    }
    notifyListeners();
  }

  void removeItem(dynamic item) {
    _items.removeWhere((cartItem) => cartItem.isSameItemAs(item));
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
        0, (total, current) => total + (current.price * current.quantity)
    );
  }


  void clear() {
    _items.clear();
    notifyListeners();
  }
}