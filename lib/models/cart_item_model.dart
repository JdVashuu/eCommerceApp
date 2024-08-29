abstract class CartItem {
  String get name;
  double get price;
  String get iconPath;
}

class CartItemModel {
  final CartItem item;
  int quantity;

  CartItemModel({required this.item, this.quantity = 1});

  String get name => item.name;
  double get price => item.price;
  String get iconPath => item.iconPath;

  bool isSameItemAs(CartItem otherItem) {
    return item.name == otherItem.name;
  }
}
