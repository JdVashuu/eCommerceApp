import 'package:flutter/material.dart';
import 'package:pls_work/models/pancake_model.dart';
import 'package:pls_work/models/shopping_cart.dart';
import 'package:pls_work/pages/home.dart';
import 'package:pls_work/providers/cart_provider.dart';
import 'package:pls_work/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class myClass extends StatelessWidget {
  const myClass({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ShoppingCartModel())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Poppins'),
            home: homePage()),
      );
}

void main() {
  runApp(myClass()
  );
}
