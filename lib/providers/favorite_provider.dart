import 'package:flutter/material.dart';
import 'package:pls_work/models/cart_item_model.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<CartItem> _favorites = [];
  List<CartItem> get favorites => _favorites;

  void toggleFavorite(CartItem item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isExist(CartItem item) {
    final isExist = _favorites.contains(item);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
