// lib/pages/shopping_cart_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pls_work/models/shopping_cart.dart';
import 'package:provider/provider.dart';


class ImageOrSvgDisplay extends StatelessWidget {
  final String imagePath;

  const ImageOrSvgDisplay({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final fileExtension = imagePath.split('.').last;

    if (fileExtension == 'svg') {
      return SvgPicture.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 35,
        height: 35,// Adjust as needed
      );
    } else {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 50,
        height: 50,// Adjust as needed
      );
    }
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer<ShoppingCartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text('Your cart is empty'));
          }
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                leading: ImageOrSvgDisplay(imagePath: item.iconPath),
                title: Text(item.name),
                subtitle: Text('Quantity: ${item.quantity}'),
                trailing: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                onLongPress: () {
                  cart.removeItem(item.item);
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<ShoppingCartModel>(
        builder: (context, cart, child) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
