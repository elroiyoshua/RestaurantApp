import 'package:flutter/material.dart';
import 'package:flutter_restaurant/model/restaurants.dart';
import 'package:flutter_restaurant/ui/detailresto.dart';

Widget CardResto(BuildContext context, RestaurantElement restaurant) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, detailResto.routeName,
          arguments: restaurant.id);
    },
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
                  height: 150,
                  width: 150,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.restaurant,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_city),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(restaurant.city),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(restaurant.rating.toString()),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
