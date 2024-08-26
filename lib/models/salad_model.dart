import 'package:flutter/material.dart';

class saladModel {
  String name;
  String iconPath;
  int ID;

  saladModel({
    required this.name,
    required this.iconPath,
    required this.ID,

  });

  static List<saladModel> getSalad(){
    List<saladModel> salads = [];

    salads.add(
      saladModel(
          name: 'Fruit Salad',
          iconPath: 'assets/images/salad/fruit_salad.png',
          ID: 1)
    );

    salads.add(
        saladModel(
            name: 'Veggie Salad',
            iconPath: 'assets/images/salad/veggie_salad.png',
            ID: 2,)
    );

    salads.add(
        saladModel(
            name: 'Veggie Loaded Salad',
            iconPath: 'assets/images/salad/veggie_loaded.png',
            ID: 3,)
    );


    return salads;
  }
}