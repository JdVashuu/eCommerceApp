import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pls_work/food/pancakes.dart';
import 'package:pls_work/food/salads.dart';
import 'package:pls_work/models/category_models.dart';

class CategoryPage extends StatelessWidget {
  List<categoryModel> categories = [];

  void _getinitialInfo() {
    categories = categoryModel.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    _getinitialInfo();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length - 1, // Adjusted to skip one item
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 20.0, // spacing between columns
                mainAxisSpacing: 20.0, // spacing between rows
                childAspectRatio: 7/8, // width to height ratio
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemBuilder: (context, index) {
                int displayIndex = index >= 4 ? index + 1 : index;

                return InkWell(
                  onTap: (){
                    if (categories[displayIndex].name == 'Salads') {
                      categories[displayIndex].navigateToPage(context, SaladOptions());
                    }
                    else{
                      categories[displayIndex].navigateToPage(context, PancakeOptions());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: categories[displayIndex].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          categories[displayIndex].iconPath,
                          width: 50,
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              categories[displayIndex].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
