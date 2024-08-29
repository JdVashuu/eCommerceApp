import 'package:pls_work/models/cart_item_model.dart';

class popularModel implements CartItem{
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool boxIsSelected;
  double price;

  popularModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxIsSelected,
    this.price = 0,
  });

  static List<popularModel> getPopular(){
    List<popularModel> popularDiets = [];

    popularDiets.add(
      popularModel(
          name: 'Blueberry Pancake',
          iconPath: 'assets/icons/blueberry-pancake.svg',
          level: 'medium',
          duration: '20 mins',
          boxIsSelected: true,
          calories: '150kCal',
          price: 19.99,
      )
    );

    popularDiets.add(
        popularModel(
          name: 'Salmon Nigiri',
          iconPath: 'assets/icons/salmon-nigiri.svg',
          level: 'Easy',
          duration: '20mins',
          calories: '120kCal',
          boxIsSelected: false,
          price: 9.99,
        )
    );

    return popularDiets;
  }
}