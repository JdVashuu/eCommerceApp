import 'package:pls_work/models/cart_item_model.dart';

class saladModel implements CartItem {
  String name;
  double price;
  String iconPath;
  int ID;
  bool isFavorite;

  saladModel({
      required this.name,
      this.price = 0.00,
      required this.iconPath,
      required this.ID,
      required this.isFavorite});

  static List<saladModel> getSalad() {
    List<saladModel> salads = [];

    salads.add(saladModel(
      name: 'Fruit Salad',
      price: 4.99,
      iconPath: 'assets/images/salad/fruit_salad.png',
      ID: 1,
      isFavorite: false,
    ));

    salads.add(saladModel(
        name: 'Veggie Salad',
        price: 4.99,
        iconPath: 'assets/images/salad/veggie_salad.png',
        ID: 2,
        isFavorite: false));

    salads.add(saladModel(
        name: 'Loaded Salad',
        price: 5.99,
        iconPath: 'assets/images/salad/veggie_loaded.png',
        ID: 3,
        isFavorite: false));

    return salads;
  }

  static List<saladModel> getFavorites(List<saladModel> salads) {
    return salads.where((salad) => salad.isFavorite).toList();
  }
}
