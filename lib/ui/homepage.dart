import 'package:flutter/material.dart';
import 'package:flutter_restaurant/model/restaurants.dart';
import 'package:flutter_restaurant/ui/cardresto.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Resto App"),
            elevation: 0,
          ),
          body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              final List<RestaurantElement> restaurant = parseResto(snapshot.data);
              return ListView.builder(
                  itemCount: restaurant.length,
                  itemBuilder: (context, index) {
                    return CardResto(context, restaurant[index]);
                  });
            },
          )),
    );
  }
}
