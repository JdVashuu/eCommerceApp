import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pls_work/food/pancakes.dart';
import 'package:pls_work/food/salads.dart';
import 'package:pls_work/models/category_models.dart';
import 'package:pls_work/models/diet_models.dart';
import 'package:pls_work/models/popular_model.dart';
import 'package:pls_work/models/shopping_cart.dart';
import 'package:pls_work/pages/category.dart';
import 'package:pls_work/pages/favorite.dart';
import 'package:pls_work/pages/shoping_cart_page.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<categoryModel> categories = [];
  List<DietModel> diets = [];
  List<popularModel> popularDiets = [];

  void _getInitialInfo() {
    categories = categoryModel.getCategory();
    diets = DietModel.getDiet();
    popularDiets = popularModel.getPopular();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView(
              children: [
                ListTile(
                  title: Text('About Us'),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Contact Us'),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Past orders'),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: (){},
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              gap: 8,
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.purple,
              tabBackgroundColor: Color(0xffC58BF2).withOpacity(0.3),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.category,
                  text: 'Categories',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Wishlist',
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> get _widgetOptions =>
      [_homePageBody(), CategoryPage(), FavoritePage(), ShoppingCartPage()];

  Widget _homePageBody() {
    return ListView(
      children: [
        searchField(),
        const SizedBox(
          height: 40,
        ),
        categorySection(),
        const SizedBox(
          height: 40,
        ),
        dietSection(),
        const SizedBox(
          height: 40,
        ),
        popularSection(),
        const SizedBox(height: 40),
      ],
    );
  }

  Column popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff1D1617).withOpacity(0.07),
                    offset: const Offset(0, 10),
                    blurRadius: 40,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(popularDiets[index].iconPath,
                      height: 65, width: 65),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        diets[index].level +
                            ' | ' +
                            diets[index].calories +
                            ' | ' +
                            diets[index].duration,
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      final selectedPopular = popularDiets[index];
                      context
                          .read<ShoppingCartModel>()
                          .addItem(selectedPopular);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${selectedPopular.name} added to cart'),
                            duration: Duration(seconds: 1)),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/button.svg',
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 25,
          ),
          itemCount: popularDiets.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
        )
      ],
    );
  }

  Column dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation \nfor diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          diets[index].level +
                              ' | ' +
                              diets[index].calories +
                              ' | ' +
                              diets[index].duration,
                          style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          diets[index].viewIsSelected
                              ? const Color(0xff9DCEFF)
                              : Color(0xff9DCEFF),
                          diets[index].viewIsSelected
                              ? const Color(0xff92A3FD)
                              : Color(0xff92A3FD),
                        ]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              color: diets[index].viewIsSelected
                                  ? Colors.white
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            final selectedDiet = diets[index];
                            context
                                .read<ShoppingCartModel>()
                                .addItem(selectedDiet);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${selectedDiet.name} added to cart'),
                                  duration: Duration(seconds: 1)),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
          ),
        )
      ],
    );
  }

  Column categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length > 5 ? 5 : categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (categories[index].name == 'Salads') {
                    categories[index].navigateToPage(context, SaladOptions());
                  } else if (categories[index].name == 'More...') {
                    categories[index].navigateToPage(context, CategoryPage());
                  } else {
                    categories[index].navigateToPage(context, PancakeOptions());
                  }
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'search Pancakes',
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/bag2.svg',
                color: Colors.black,
              ),
            ))

      ],
    );
  }
}
