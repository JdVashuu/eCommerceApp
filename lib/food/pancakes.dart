import 'package:flutter/material.dart';
import 'package:pls_work/models/pancake_model.dart';
import 'package:pls_work/models/shopping_cart.dart';
import 'package:pls_work/pages/shoping_cart_page.dart';
import 'package:pls_work/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class PancakeOptions extends StatefulWidget {
  const PancakeOptions({super.key});

  @override
  State<PancakeOptions> createState() => _PancakesOptionsState();
}

class _PancakesOptionsState extends State<PancakeOptions> {
  final List<pancakeModel> pancakes = pancakeModel.getPancakes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pancakes',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)
        ),
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
          childAspectRatio: 3/4.2, // Aspect ratio of the cards
        ),
        itemCount: pancakes.length,
        itemBuilder: (context, index) {
          //return PancakeCard(pancakes : pancakes[index]);
          return PancakeCard(pancakes: pancakes[index]);
        },
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}

class PancakeCard extends StatefulWidget {
  final pancakeModel pancakes;
  PancakeCard({required this.pancakes});

  @override
  State<PancakeCard> createState() => _PancakeCardState();
}

class _PancakeCardState extends State<PancakeCard> {
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
              widget.pancakes.iconPath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 120,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported, size: 60, color: Colors.grey[600]),
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
                  widget.pancakes.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  '\$${widget.pancakes.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.0, color: Colors.green),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle buy logic here
                        context.read<ShoppingCartModel>().addItem(widget.pancakes);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.pancakes.name} added to cart'),
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
                        provider.isExist(widget.pancakes) ? Icons.favorite : Icons.favorite_border,
                        color: provider.isExist(widget.pancakes) ? Colors.red : Colors.grey,
                      ),
                      onPressed: () => provider.toggleFavorite(widget.pancakes)
                      )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

