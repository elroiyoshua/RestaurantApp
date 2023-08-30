import 'package:flutter/material.dart';
import 'package:flutter_restaurant/resources.dart';

class detailResto extends StatelessWidget {
  static const routeName = '/detailresto';
  final Restaurant restaurant;

  const detailResto({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Located at ${restaurant.city} with rate ${restaurant.rating}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    restaurant.description,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Foods:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: restaurant.foods.items.map((food) {
                      return ListTile(
                        leading: Hero(
                          tag: Object(),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/food.png'),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(food.name),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Drinks:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: restaurant.drinks.items.map((drink) {
                      return ListTile(
                        leading: Hero(
                          tag: Object(),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/soda.png'),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(drink.name),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
