import 'package:flutter/material.dart';

class DietModel{
  String name;
  String iconPath;
  Color boxColor;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiet(){
    List<DietModel> diets = [];

    diets.add(
      DietModel(
          name: 'Honey Pancake',
          iconPath: 'assets/icons/honey-pancakes.svg',
          boxColor: Color(0xff9DCEFF),
          level: 'Easy',
          duration: '30 mins',
          calories: '180kCal',
          viewIsSelected: true,
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
        )
    );


    return diets;
  }
}