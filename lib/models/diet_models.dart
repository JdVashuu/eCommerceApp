import 'package:flutter/material.dart';
import 'package:pls_work/models/cart_item_model.dart';

class DietModel implements CartItem{
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;
  double price;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected,
    this.price = 0.00,
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
          name: 'Honey Pancake',
          iconPath: 'assets/icons/honey-pancakes.svg',
          boxColor: Color(0xff9DCEFF),
          level: 'Easy',
          duration: '30 min',
          calories: '180kCal',
          viewIsSelected: true,
          price: 29.99,
      )
    );

    diets.add(
        DietModel(
          name: 'Canai Bread',
          iconPath: 'assets/icons/canai-bread.svg',
          boxColor: Color(0xffEEA4CE),
          level: 'Easy',
          duration: '20 min',
          calories: '230kCal',
          viewIsSelected: false,
          price: 14.99,
        )
    );


    return diets;
  }
}