import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/restaurant_bloc.dart';
import 'package:flutter_restaurant/ui/detailresto.dart';
import 'package:flutter_restaurant/model/restaurants.dart';
import 'package:flutter_restaurant/ui/homepage.dart';
import 'package:flutter_restaurant/ui/searchresto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantBloc()..add(GetRestaurantEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: MyHomePage.routeName,
        routes: {
          MyHomePage.routeName: (context) => const MyHomePage(),
          detailResto.routeName: (context) => detailResto(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as RestaurantElement),
          SearchPage.routeName: (context) => const SearchPage(),
        },
      ),
    );
  }
}
