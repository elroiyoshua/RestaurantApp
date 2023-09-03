import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_restaurant/bloc/restaurant_bloc.dart';
import 'package:flutter_restaurant/bloc/search/resto_search_bloc.dart';
import 'package:flutter_restaurant/model/restaurantsearch.dart';
import 'package:flutter_restaurant/ui/detailresto.dart';
import 'package:flutter_restaurant/model/restaurants.dart';
import 'package:flutter_restaurant/ui/homepage.dart';
import 'package:flutter_restaurant/ui/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestoSearchBloc()..add(GetRestaurantSearchEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: Searchpage.routeName,
        routes: {
          // MyHomePage.routeName: (context) => const MyHomePage(),
          detailResto.routeName: (context) => detailResto(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as Restaurantsearch),
          Searchpage.routeName: (context) => const Searchpage(),
        },
      ),
    );
  }
}
