import 'package:flutter/material.dart';
import 'package:flutter_restaurant/ui/detailresto.dart';
import 'package:flutter_restaurant/model/restaurants.dart';
import 'package:flutter_restaurant/ui/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => const MyHomePage(),
        detailResto.routeName: (context) => detailResto(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as RestaurantElement),
      },
    );
  }
}
