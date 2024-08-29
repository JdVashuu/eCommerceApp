import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pls_work/food/salads.dart';

class categoryModel {
  String name;
  String iconPath;
  Color boxColor;


  categoryModel(
      {
        required this.name,
        required this.iconPath,
        required this.boxColor,

      });

  void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static List<categoryModel> getCategory() {
    List<categoryModel> categories = [];

    categories.add(categoryModel(
        name: 'Salads',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff92A3FD),

    ),
    );

    categories.add(categoryModel(
        name: 'Pancakes',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffC58BF2),
    )
    );

    categories.add(categoryModel(
        name: 'Pies',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff92A3FD)));

    categories.add(categoryModel(
        name: 'Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        boxColor: Color(0xffC58BF2)));

    categories.add(categoryModel(
        name: 'More... ',
        iconPath: 'assets/icons/Chevron Right Icon.svg',
        boxColor: Color(0xffC58BF2)));

    return categories;
  }
}
