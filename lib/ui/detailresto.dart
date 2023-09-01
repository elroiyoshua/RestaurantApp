import 'package:flutter/material.dart';
import 'package:flutter_restaurant/model/restaurants.dart';

class detailResto extends StatelessWidget {
  static const routeName = '/detailresto';
  final RestaurantElement restaurant;

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
                  title: Text(
                    restaurant.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
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
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Located at ${restaurant.city} with rate ${restaurant.rating}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    restaurant.description,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
