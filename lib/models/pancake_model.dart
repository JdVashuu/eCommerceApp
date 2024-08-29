import 'package:pls_work/models/cart_item_model.dart';

class pancakeModel implements CartItem {
  String name;
  double price;
  String iconPath;
  int ID;
  bool isFavorite;

  pancakeModel({
    required this.name,
    this.price = 0.00,
    required this.iconPath,
    required this.ID,
    this.isFavorite = false});

  static List<pancakeModel> getPancakes() {
    List<pancakeModel> pancakes = [];

    pancakes.add(pancakeModel(
      name: 'Strawberry Pancake',
      price: 14.99,
      iconPath: 'assets/images/pancake/strawberry.jpeg',
      ID: 11,
    ));

    pancakes.add(pancakeModel(
        name: 'ChocoLate Pancake',
        price: 14.99,
        iconPath: 'assets/images/pancake/icecream.jpeg',
        ID: 12,
    ));

    pancakes.add(pancakeModel(
        name: 'Blueberry Pancake',
        price: 19.99,
        iconPath: 'assets/images/pancake/blueberry.jpeg',
        ID: 13,
    ));

    return pancakes;
  }

  static List<pancakeModel> getFavorites(List<pancakeModel> pancakes) {
    return pancakes.where((pancake) => pancake.isFavorite).toList();
  }
}
