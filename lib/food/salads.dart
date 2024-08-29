import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pls_work/models/salad_model.dart';
import 'package:pls_work/models/shopping_cart.dart';
import 'package:pls_work/providers/favorite_provider.dart';
import 'package:pls_work/pages/shoping_cart_page.dart';

class SaladOptions extends StatefulWidget {
  @override
  State<SaladOptions> createState() => _SaladOptionsState();
}

class _SaladOptionsState extends State<SaladOptions> {
  final List<saladModel> salads = saladModel.getSalad();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salads',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingCartPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 3 / 4.2, // Aspect ratio of the cards
        ),
        itemCount: salads.length,
        itemBuilder: (context, index) {
          final allProducts = salads[index];
          return SaladCard(salad: allProducts);
        },
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}

class SaladCard extends StatefulWidget {
  final saladModel salad;
  SaladCard({required this.salad});

  @override
  State<SaladCard> createState() => _SaladCardState();
}

class _SaladCardState extends State<SaladCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.asset(
              widget.salad.iconPath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 120,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported,
                      size: 60, color: Colors.grey[600]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.salad.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5.0),
                Text(
                  '\$${widget.salad.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.0, color: Colors.green),
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle buy logic here
                          context
                              .read<ShoppingCartModel>()
                              .addItem(widget.salad);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('${widget.salad.name} added to cart'),
                                duration: Duration(seconds: 1)),
                          );
                        },
                        child: Text('Buy'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            provider.isExist(widget.salad)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: provider.isExist(widget.salad)
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () =>
                              provider.toggleFavorite(widget.salad))
                    ]
                    // Handle favorite toggle logic here

                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
