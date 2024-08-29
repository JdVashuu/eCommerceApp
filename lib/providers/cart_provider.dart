import 'package:flutter/material.dart';
import 'package:pls_work/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _cart = [];
  List<CartItemModel> get items => _cart;

}