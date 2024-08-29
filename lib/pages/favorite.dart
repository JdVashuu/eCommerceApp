import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pls_work/models/pancake_model.dart';
import '../providers/favorite_provider.dart';

class FavoritePage extends StatefulWidget {

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Favorties",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed:(context) {
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'delete',
                            ),
                          ]
                      ),
                      child: ListTile(
                        title: Text(
                          finalList[index].name,
                          style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red.shade100,
                          backgroundImage: AssetImage(finalList[index].iconPath),
                        ),
                        trailing: Text(
                          '\$${finalList[index].price}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                        )
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
        }
}
